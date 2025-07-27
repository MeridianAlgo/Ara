#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

# Header
echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                 ARA AI STOCK ANALYSIS                        ║"
echo "║              Perfect Prediction System                       ║"
echo "║                   Installation                               ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Check if Python is installed
echo -e "${BLUE}[1/6] Checking Python installation...${NC}"
if ! command -v python3 &> /dev/null; then
    if ! command -v python &> /dev/null; then
        print_error "Python is not installed"
        echo
        echo "Please install Python 3.8+ using your package manager:"
        echo "  Ubuntu/Debian: sudo apt update && sudo apt install python3 python3-pip"
        echo "  CentOS/RHEL:   sudo yum install python3 python3-pip"
        echo "  macOS:         brew install python3"
        echo "  Or download from: https://python.org"
        exit 1
    else
        PYTHON_CMD="python"
    fi
else
    PYTHON_CMD="python3"
fi

$PYTHON_CMD --version
print_status "Python found!"
echo

# Check Python version
echo -e "${BLUE}[2/6] Verifying Python version...${NC}"
if ! $PYTHON_CMD -c "import sys; exit(0 if sys.version_info >= (3, 8) else 1)" 2>/dev/null; then
    print_error "Python 3.8+ required"
    echo "Please upgrade your Python installation"
    exit 1
fi
print_status "Python version compatible!"
echo

# Check if pip is available
echo -e "${BLUE}[3/6] Checking pip installation...${NC}"
if ! $PYTHON_CMD -m pip --version &> /dev/null; then
    print_error "pip is not installed"
    echo "Please install pip:"
    echo "  Ubuntu/Debian: sudo apt install python3-pip"
    echo "  CentOS/RHEL:   sudo yum install python3-pip"
    echo "  macOS:         curl https://bootstrap.pypa.io/get-pip.py | python3"
    exit 1
fi
print_status "pip found!"
echo

# Upgrade pip
echo -e "${BLUE}[4/6] Upgrading pip...${NC}"
$PYTHON_CMD -m pip install --upgrade pip --quiet --user
print_status "pip upgraded!"
echo

# Install required packages
echo -e "${BLUE}[5/6] Installing dependencies...${NC}"
print_info "This may take a few minutes..."
if ! $PYTHON_CMD -m pip install -r requirements.txt --quiet --user; then
    print_error "Installation failed"
    echo "Please check your internet connection and try again"
    echo "You may need to install additional system packages:"
    echo "  Ubuntu/Debian: sudo apt install python3-dev build-essential"
    echo "  CentOS/RHEL:   sudo yum groupinstall 'Development Tools'"
    exit 1
fi
print_status "Dependencies installed!"
echo

# Verify installation
echo -e "${BLUE}[6/6] Verifying installation...${NC}"
if ! $PYTHON_CMD -c "import torch, pandas, numpy, yfinance, rich; print('✅ All packages verified!')" 2>/dev/null; then
    print_error "Verification failed"
    echo "Some packages may not have installed correctly"
    echo "Try running: $PYTHON_CMD -m pip install -r requirements.txt --user"
    exit 1
fi

echo
echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                   INSTALLATION COMPLETE!                    ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"
echo
echo -e "${GREEN}🚀 Ready to use Ara AI Stock Analysis!${NC}"
echo
echo -e "${YELLOW}📊 USAGE EXAMPLES:${NC}"
echo "   $PYTHON_CMD ara.py AAPL --verbose    (Detailed Apple analysis)"
echo "   $PYTHON_CMD ara.py NVDA              (Quick NVIDIA analysis)"
echo "   $PYTHON_CMD ara.py TSLA --verbose    (Detailed Tesla analysis)"
echo
echo -e "${YELLOW}📈 UTILITY COMMANDS:${NC}"
echo "   $PYTHON_CMD check_accuracy.py        (View prediction accuracy)"
echo "   $PYTHON_CMD view_predictions.py      (View prediction history)"
echo "   $PYTHON_CMD comprehensive_report.py  (Full system report)"
echo
echo -e "${YELLOW}🎯 FEATURES:${NC}"
echo "   • Perfect prediction system (sub-1% error target)"
echo "   • 62 advanced features"
echo "   • Ultra-advanced neural networks"
echo "   • Real-time accuracy validation"
echo "   • Automated learning system"
echo
echo -e "${BLUE}💡 TIP: Add an alias to your shell profile:${NC}"
echo "   echo 'alias ara=\"$PYTHON_CMD $(pwd)/ara.py\"' >> ~/.bashrc"
echo "   source ~/.bashrc"
echo "   # Then use: ara AAPL --verbose"
echo