{
   // list existing style:
   // gROOT->GetListOfStyles()->Print()

   // pick up one:
   gROOT->SetStyle("Plain");

   // modify it:
   gStyle->SetMarkerStyle(7);
   gStyle->SetLegendBorderSize(0);
   gStyle->SetLegendFont(22);
   gStyle->SetTitleBorderSize(0);
   gStyle->SetOptStat(1111110); // show more information
   gStyle->SetOptFit(); // show fit result
   gStyle->SetFitFormat(".2f"); // shorten fit result
   gStyle->SetStatX(0.99); // top right corner x
   gStyle->SetStatY(0.99); // top right corner yx
   gStyle->SetStatFont(22);
   gStyle->SetLabelFont(22,"XYZ");
   gStyle->SetTitleFont(22,"H");
   gStyle->SetTitleFont(22,"XYZ");
   gStyle->SetLabelSize(0.05,"XYZ");
   gStyle->SetTitleSize(0.05,"XYZ");
   gStyle->SetTitleOffset(1.1,"Y");
   gStyle->SetTitleOffset(-0.5,"Z");
   //gStyle->SetPadRightMargin(0.02);
   gStyle->SetPadLeftMargin(0.12);
   //gStyle->SetPadTopMargin(0.02);
   gStyle->SetPadBottomMargin(0.11);
   // http://root.cern.ch/root/html/TAttText.html#T1
   gStyle->SetTitleAlign(23);
   gStyle->SetTitleX(0.5);

   const Int_t NRGBs = 5;
   const Int_t NCont = 255;

   Double_t stops[NRGBs] = { 0.00, 0.34, 0.61, 0.84, 1.00 };
   Double_t red[NRGBs]   = { 0.00, 0.00, 0.87, 1.00, 0.51 };
   Double_t green[NRGBs] = { 0.00, 0.81, 1.00, 0.20, 0.00 };
   Double_t blue[NRGBs]  = { 0.51, 1.00, 0.12, 0.00, 0.00 };
   TColor::CreateGradientColorTable(NRGBs, stops, red, green, blue, NCont);
   gStyle->SetNumberContours(NCont);

   // apply this style to histograms created with other styles
   gROOT->ForceStyle();
}
