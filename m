Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F1820CD22
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2020 10:05:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpomo-0006Gs-PK; Mon, 29 Jun 2020 08:05:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peter.chen@nxp.com>) id 1jpomk-0006EU-3Z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jun 2020 08:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mbKZYLhhSZayRn3tTTgkkMtREn3iOksaorqNPNx6jKw=; b=XNh26gednPJlgJ5s1N5QFLTl76
 ny2Qeemd+ukSyFRZvWe4Plg+GyYzn5anGAnRo6TTR5F66fzqq2mJptmimeOoGCol2TclWLq+IkXNb
 qTABLeEMdmdlcZ49W4XRdpAraECjXAjaM14FwLe5/G5nplVQIbJ+MxBInwFL5RV1uqTA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mbKZYLhhSZayRn3tTTgkkMtREn3iOksaorqNPNx6jKw=; b=U2KUWOVf00QYFpi32CMq5B1Y0n
 BSFo8SaFFXiBP/NHxonxxZTj1+gchRArGfY9EtrgPO0gmbVuL72Fm3d1hCivNn545SnoVFNjwS6mo
 ooe8kGl49lNTMAlZqaQ08uUpdf3i0WG69G6cChqnietfrkWlW60UGvqUMBO9K5X0iZ64=;
Received: from mail-eopbgr70083.outbound.protection.outlook.com ([40.107.7.83]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpomc-005kiX-MO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jun 2020 08:05:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ft6yglmTHDVtktlMCxhD3ymSmvoGXhnIDhqDHVQvr9GCpl/gEIJPktMMYuPzjL/N0uoBSlJRaAB+yDuK+yqPAwvWwW6YjTjdNg4izkml65jp6JQ2Z065mPV9S+qr31jOhCSZd/5s1xinsQej+FXh6r2cvRgPjpon8lkQRFM7CWBXLwhBuVSKGGOx6aswBKpEs1sWiXM/5NsLM/RHElyvUTGxhKB7S0MMpbHQAdOTnHjZWGnCMYefHdLIq+11h5JpPllQ9oQYyZoYoL86MIRtAjtPrzO0sc0g+/ycLyMLkNIBObcE5Iy6xDtICIM2IVXBKKLEd0Otx2NGMHo8O2JLjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbKZYLhhSZayRn3tTTgkkMtREn3iOksaorqNPNx6jKw=;
 b=dY4SWRWXZAR+OzMdKJESp1Fg/Yd65biXL30q/ouFgXLfc+kclwQB5Jp0csFkjDQTuROGKcCNNgHo4TLFzNseX4kFQR9nVd0lzPBAlag9j1ZWhhvgALXaRlPxpldDQKqhy0+AucSF4s+Q/Lkc5o0liWKT8P6mfJw9Hhf38LuUlTDwR9HgsorKWWJSeuI160H2ReaNEAFlPAweeBu/5GlztIcoPobffO9qHLbt8uwYG2y1an2esZnmB9Y47bjG0/BuLpcYQZOc5LzxBmpxh7eZFWcUILgTgemggfLVmmqdKrm1V9N3aG9v9K6+wxFwZdz06AT4Pd8jKoEfd6d//P2Yjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbKZYLhhSZayRn3tTTgkkMtREn3iOksaorqNPNx6jKw=;
 b=Sx1YMjRU9TVbQBX+5GNLK8ucd4kUsPr6T8rASCYgOmOv01+6F95YmMJPSB5r+ELfllGgp06LK3yPXXYG1paGWW/nPpk0amj/Kl+ClnHchKeP+Rkepel0pfqk6U0qTtbvx5ygGEgxlkffltdeDIF7igqfW5C80KgEOHNL/JED9u0=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5320.eurprd04.prod.outlook.com (2603:10a6:20b:3::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Mon, 29 Jun
 2020 03:31:11 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3131.027; Mon, 29 Jun 2020
 03:31:11 +0000
From: Peter Chen <peter.chen@nxp.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Thread-Topic: [PATCH 1/4] usb: cdns3: gadget: Replace trace_printk by dev_dbg
Thread-Index: AQHWTFEU7Ns/P6zMj06V9UlvThL4Oaju8vKA
Date: Mon, 29 Jun 2020 03:31:11 +0000
Message-ID: <20200629033134.GA30684@b29397-desktop>
References: <20200627070307.516803-1-drinkcat@chromium.org>
 <20200627070307.516803-2-drinkcat@chromium.org>
In-Reply-To: <20200627070307.516803-2-drinkcat@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 19f9d785-7766-4c26-5286-08d81bdcdec2
x-ms-traffictypediagnostic: AM6PR04MB5320:
x-microsoft-antispam-prvs: <AM6PR04MB53209C23033CCB5B5DE292CF8B6E0@AM6PR04MB5320.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wOY4bwYTyOMFB6cCYp4abZPoOGUTO0s+HfgQNJnOKMgSoMN5Pk6EomxRk+Sqa4yVPhN9H2xSp28MMQKnvopGWxEn+JoVfOFr2lYLN6U7zrxOYZeytPyZ3A3XjEK4mV/UPyxrebMSHn66xuptz7uczTOR/ZSiklPzC7HtlOWZV0mcD5A4LDQmsyalyNjDyGPAT1tY7jtUnDRG0uAj8+jBkNwZQhP0V7kBJGrRW5BLwrdhcChjM5m0ifl7YNmZLsFVEZ9fX1fCIpYVvke7LARciBPuvkaNO2QtZzKI4FNx0bTRK57eiQ3TL9rtFFulO61Wkds5gjALGubHD1okUI8QmQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7157.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(7916004)(366004)(136003)(376002)(346002)(396003)(39860400002)(6486002)(66946007)(91956017)(76116006)(66476007)(83380400001)(66556008)(64756008)(66446008)(86362001)(54906003)(8676002)(8936002)(6506007)(53546011)(5660300002)(44832011)(186003)(4326008)(4744005)(26005)(478600001)(9686003)(6512007)(33716001)(71200400001)(33656002)(6916009)(1076003)(7416002)(7406005)(2906002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: UJBNCRkEMWrUuyeIaNECfY/rPk198XO/0DkgAID4y8CVG/DFFsq1Y+exsmDroSy319akil2gX5VNSsJT7Serzf7ZpxTYf8JuCRQUcqba3eQ3mHOQlIKbxOzUwBgDSjSOr5+5DHbqtWHYMPGcPaLbb/xpT4SGsfPxMCXqq7kYl86JdBQEMVIVw02QfWN3a5NZ5IOOgEh/nCG28qrnsCbbT8TGtGzKyylYclqh0AGLG9bDtNCKhnsv+47v9FvJ8cYYjr5vh7/YD2JKP+V3X22HL5xq+yJ2iwMorzuaS1oHJjzD6atvrNI6ujmFd+p9IGf69S2kGMm9zyv1sD7nfvtUJz1Q9k0zRcsecotU7/IJnUeDdwIvCgkLt0kC2xe7ldwXmzrMoiLmEsNo8KKWXIOAvTCn/Aud3ru3YQC8j9rCNwiLSCB+owhStUOg8qj71DONhWQGFZQt9ws1SXJvpXTBWpM7HtEZbGMTkZ1fsU/23pA=
x-ms-exchange-transport-forked: True
Content-ID: <8E174474B701384BA7BA90CB938E0144@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f9d785-7766-4c26-5286-08d81bdcdec2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 03:31:11.6315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gr8Ppd6maaY3NNnKCQ+jMhOUPQz4dm45gkCxdQGca7AZAdp/+jHYXfUeMOAv+ojAUhzes2JwFn5zGfzxHrCiUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5320
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.7.83 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jpomc-005kiX-MO
Subject: Re: [f2fs-dev] [PATCH 1/4] usb: cdns3: gadget: Replace trace_printk
 by dev_dbg
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "Guilherme G . Piccoli" <gpiccoli@canonical.com>,
 Rafael Aquini <aquini@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Howells <dhowells@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Will Deacon <will@kernel.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Kees Cook <keescook@chromium.org>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jayshri Pawar <jpawar@cadence.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andy Gross <agross@kernel.org>,
 Tomas Winkler <tomas.winkler@intel.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Pawel Laszczak <pawell@cadence.com>, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Divya Indi <divya.indi@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 20-06-27 15:03:04, Nicolas Boichat wrote:
> trace_printk should not be used in production code, replace it
> call with dev_dbg.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> 
> ---
> 
> Unclear why a trace_printk was used in the first place, it's
> possible that some rate-limiting is necessary here.
> 
>  drivers/usb/cdns3/gadget.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> index 5e24c2e57c0d8c8..c303ab7c62d1651 100644
> --- a/drivers/usb/cdns3/gadget.c
> +++ b/drivers/usb/cdns3/gadget.c
> @@ -421,7 +421,7 @@ static int cdns3_start_all_request(struct cdns3_device *priv_dev,
>  		if ((priv_req->flags & REQUEST_INTERNAL) ||
>  		    (priv_ep->flags & EP_TDLCHK_EN) ||
>  			priv_ep->use_streams) {
> -			trace_printk("Blocking external request\n");
> +			dev_dbg(priv_dev->dev, "Blocking external request\n");
>  			return ret;
>  		}
>  	}
> -- 

Reviewed-by: Peter Chen <peter.chen@nxp.com>

-- 

Thanks,
Peter Chen

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
