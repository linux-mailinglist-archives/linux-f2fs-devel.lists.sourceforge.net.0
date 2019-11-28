Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A76910C270
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2019 03:35:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ia9eK-0000Mz-On; Thu, 28 Nov 2019 02:35:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2285f8a38=shinichiro.kawasaki@wdc.com>)
 id 1ia9eF-0000Mn-Da
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Nov 2019 02:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BQRqcICeNNZJ0xH03yCocvcOCIXayx13klFQGr0ucD0=; b=AtVa1GTxqD86E2DVHjGUEDDo5z
 VkrCfv9L4/oL+NS4HVgwyGVldO0mhS8gHB8jEw6jPl7JEgZ+rFARUpeTpK3SKVEXL64DRU9FIIoRg
 UERtCM2nyUcTFZGBWTFHcTfL5amkKNYKmNjJpKdasNfhQS84llMvze0IOkvAXFMaxei8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BQRqcICeNNZJ0xH03yCocvcOCIXayx13klFQGr0ucD0=; b=Fa88Df+1Ul+Ve627Oi5DWuopmV
 zeXBdGXCPzCwkuoVY9i8UaqBNjzrRH5eZ1IxwMptZhyCSwt6yVMETTMJh+clfUH/jPDyG8j5Ssc0M
 RyFwHKyWG3j0ntxpLEO/W8VwpYYJOCzuDvTuHdKRYewIFQVtVnCE469xOBbv+fzE7DoU=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ia9eD-00FafW-BK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Nov 2019 02:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1574908513; x=1606444513;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ekOU0kQbuGm474hNED4kL5Grj2ms63FFsolVYJZiCHY=;
 b=OMnkEC3/bltPsQQMwVkHC9eoxp2XHU9sBnXJapYQwScXxuysNsnHx+Ex
 8pjpogcXPNSDAmhUnFUGiCH7OVVc1qmCbgq2k3QdcClVOT3OgtGk9Nltz
 eqhaazmSVgZUPn6gm2B7WOTamelDW421ABdSwQxJ9c7ahStExWsH2gCRz
 uN7DWhfCYeQm4Bt3Rhi2WelEYG2Soygf7f4tf1OpYVtwg4eA2V/xlTMqz
 Ttu+aI3AGZ2rIxbwkrjlS9FoD4SxhMh5o9/VtS8LXnSd68YCasL9r5RCp
 c+r/364yxeqpjwsbLmeqK0Xf8I3uHB3L4tS85Wm62QV823tQoj2KH5qU3 w==;
IronPort-SDR: FuRXnZE6TNurlsFlI2EFnxpRsrc1khzPPiRU1vaBeusXcydWP0uNw5lB8rziiu6/E1oPQFtvQ1
 k4rZYzfCBainmouXAhd6Q6dGMxNY09ZyhqYMt1P1XYCT3bIvUYZNdYMAplqScf39bdtFzdcnuf
 cu6k6Drq+TaAYJAQzc7Ta0SoGH+65P7f9E9MP9phZEV/vQbe/PjAAhrXhrKzL4f61mdIFF6yHj
 FyK7CSk6jA7ZwlzNceqW2DsfNYUXLKk8UOzpJrADH7azNyEbCajrNh8fgYEY0yRNn/xbN+t7cy
 XWI=
X-IronPort-AV: E=Sophos;i="5.69,251,1571673600"; d="scan'208";a="125783808"
Received: from mail-dm3nam03lp2051.outbound.protection.outlook.com (HELO
 NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.51])
 by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2019 10:34:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIqG80hJbFcIU4SUUrUJDmAcJbHPxYmh0LUmMnJQSgk7E+TIBtOGSlUoi28eCIJg9uSQZuJMmTUEjbjqmBnMQalav2H3B6w1d2A6kTMzOdTVgWvQrY0PRHwIMAGNwViJltpntfbUBeVR2JVh0qfqhvJ9etSYmpBtV6KcbRsITpzz5jirhDUVI3assCsWKaNA6HrzRLqtFXD7AZsijGBWrwYnx5KQqU22gDUoXngVrBhPBfMi/L88QU8JFI+pJTmjXJ/MZqrcR0MehMgDdddkyaBW+FK53g4n3gWtB0MKGiZ2IDoeiWPzwnBp3IOBuhZrBYGnWwgx+pvwmyVedjMz4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQRqcICeNNZJ0xH03yCocvcOCIXayx13klFQGr0ucD0=;
 b=f2+DRNFypMK2w49jlfooEwHDXsDu7kL7x5178ivzIEWR4v2+TeDI5mkzdLg7Q7Trwwr/jWpzdiYmkZji+KwM6vQnxjOQPFVkUsjoUrfjvBjoQnmtYZstQtnYvw4FmvO9UtkRB1mriGL0c78dBZEstmfsEyT/fquS03o07jSxrajZGFC/8Gvy9loilLbdIQho6RZBxR90BXpppcU9Z6MYn4BnZg7No1rTM/B85R96ZNeVgCXgWttXt+6HFOJ7SsaZlftRNiG5Kf49vvf0/3TmnA9xswOfCehwHKQCIV9DDyWm51kIzCf1xfyL2xAj1DpZhAxTUZtpb3A18eHIVg4y6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQRqcICeNNZJ0xH03yCocvcOCIXayx13klFQGr0ucD0=;
 b=GIm36vf0tqWcGBvb5s+YZRS0V67pQcSYqD/fuT/b+elBKMv9kb5u1RvTbCPO9nl1r65TS7S07QwGGoN5JPNerMdxai/a9ebEsYVvF7TQLKUg3qapZTOU2aUQ2JxIE1EARxBq8zjPqohtUMCqRL21Qio46q1/nH1jLdnKiQD/TWw=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2348.namprd04.prod.outlook.com (10.167.17.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Thu, 28 Nov 2019 02:34:55 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74%11]) with mapi id 15.20.2474.023; Thu, 28 Nov
 2019 02:34:55 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [PATCH] f2fs: Fix direct IO handling
Thread-Index: AQHVpC8oudPXEy0mBEmfCTgj/M+d7aeeHoMAgAHB64A=
Date: Thu, 28 Nov 2019 02:34:55 +0000
Message-ID: <20191128023447.wopisf4nh2l63evv@shindev.dhcp.fujisawa.hgst.com>
References: <20191126075719.1046485-1-damien.lemoal@wdc.com>
 <20191126234428.GB20652@jaegeuk-macbookpro.roam.corp.google.com>
In-Reply-To: <20191126234428.GB20652@jaegeuk-macbookpro.roam.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7c26b4f5-2a66-49db-fe5c-08d773ab8e00
x-ms-traffictypediagnostic: CY1PR04MB2348:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2348C068F495A456F0195811ED470@CY1PR04MB2348.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0235CBE7D0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(199004)(189003)(81166006)(8936002)(76116006)(64756008)(86362001)(71190400001)(478600001)(11346002)(102836004)(9686003)(6512007)(14454004)(14444005)(6436002)(44832011)(2906002)(446003)(7736002)(6486002)(256004)(1076003)(54906003)(6116002)(99286004)(6246003)(186003)(4326008)(3846002)(5660300002)(26005)(76176011)(66066001)(6506007)(71200400001)(6916009)(66476007)(66556008)(66946007)(229853002)(91956017)(8676002)(81156014)(316002)(25786009)(66446008)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2348;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SSyzbA1xyzV8lkgzdHZbCtR+3y8LVe7qLh+TYjJdIYIdsZC4oEPDRMJteciRBDyVyV7gZBYHqvdGYVQwwNeaPlk6BK/Ny92/Ic3yxB+iQPa7Gus+UAQJBtUv42gazBtMsTMVGNqMTnJutlx5D6DkC89GVHiIun9WZ+rqq8YBGMbvXKlGbUYOd5elIT6mVdTrW3Z78cBvsq0YBQeqKdpv0mtTocfYTZssLANPzesFZfLckXDnVI3d/0fSMbH4W7/wr/pPdNpqV7Vccs4fYme3XyPQy5jXeqKSpUslNdP9vOB5/8BqLIcZw7VxTLH5e/MmqQyQIUFrrDiwVw5jiaXvtbz7Emi94bv2qOjBr1hkPLvouYdIL/5XeA/TtRe7Z8x6at8DFb2ilcbTlMEExEftqCCpgHD2JZi/A3EjPX1jeqLpDRJ3McKw0eF9DYvaNx7c
Content-ID: <8E365806411AA54BB3C5D02C69405593@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c26b4f5-2a66-49db-fe5c-08d773ab8e00
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2019 02:34:55.3836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JGo1IL/Vftfu8a2vUOxKLgB/1n8p0AcXit+g5GiIes8yl+MMnPYiylvyr0Rf410Y3fgDzOKMjC3LPRzht7trWuCAlOcoqudwG+SqqaOnHJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2348
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ia9eD-00FafW-BK
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix direct IO handling
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Javier Gonzalez <javier@javigon.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Nov 26, 2019 / 15:44, Jaegeuk Kim wrote:
> On 11/26, Damien Le Moal wrote:
> > f2fs_preallocate_blocks() identifies direct IOs using the IOCB_DIRECT
> > flag for a kiocb structure. However, the file system direct IO handler
> > function f2fs_direct_IO() may have decided that a direct IO has to be
> > exececuted as a buffered IO using the function f2fs_force_buffered_io().
> > This is the case for instance for volumes including zoned block device
> > and for unaligned write IOs with LFS mode enabled.
> > 
> > These 2 different methods of identifying direct IOs can result in
> > inconsistencies generating stale data access for direct reads after a
> > direct IO write that is treated as a buffered write. Fix this
> > inconsistency by combining the IOCB_DIRECT flag test with the result
> > of f2fs_force_buffered_io().
> > 
> > Reported-by: Javier Gonzalez <javier@javigon.com>
> > Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> > ---
> >  fs/f2fs/data.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 5755e897a5f0..8ac2d3b70022 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -1073,6 +1073,8 @@ int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
> >  	int flag;
> >  	int err = 0;
> >  	bool direct_io = iocb->ki_flags & IOCB_DIRECT;
> > +	bool do_direct_io = direct_io &&
> > +		!f2fs_force_buffered_io(inode, iocb, from);
> >  
> >  	/* convert inline data for Direct I/O*/
> >  	if (direct_io) {
> > @@ -1081,7 +1083,7 @@ int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
> >  			return err;
> >  	}
> >  
> > -	if (direct_io && allow_outplace_dio(inode, iocb, from))
> > +	if (do_direct_io && allow_outplace_dio(inode, iocb, from))
> 
> It seems f2fs_force_buffered_io() includes allow_outplace_dio().
> 
> How about this?

Thanks. I confirmed that the issue is gone with your patch.

Tested-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>

> ---
>  fs/f2fs/data.c | 13 -------------
>  fs/f2fs/file.c | 35 +++++++++++++++++++++++++----------
>  2 files changed, 25 insertions(+), 23 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index a034cd0ce021..fc40a72f7827 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1180,19 +1180,6 @@ int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
>  	int err = 0;
>  	bool direct_io = iocb->ki_flags & IOCB_DIRECT;
>  
> -	/* convert inline data for Direct I/O*/
> -	if (direct_io) {
> -		err = f2fs_convert_inline_inode(inode);
> -		if (err)
> -			return err;
> -	}
> -
> -	if (direct_io && allow_outplace_dio(inode, iocb, from))
> -		return 0;
> -
> -	if (is_inode_flag_set(inode, FI_NO_PREALLOC))
> -		return 0;
> -
>  	map.m_lblk = F2FS_BLK_ALIGN(iocb->ki_pos);
>  	map.m_len = F2FS_BYTES_TO_BLK(iocb->ki_pos + iov_iter_count(from));
>  	if (map.m_len > map.m_lblk)
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index c0560d62dbee..6b32ac6c3382 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3386,18 +3386,33 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  				ret = -EAGAIN;
>  				goto out;
>  			}
> -		} else {
> -			preallocated = true;
> -			target_size = iocb->ki_pos + iov_iter_count(from);
> +			goto write;
> +		}
>  
> -			err = f2fs_preallocate_blocks(iocb, from);
> -			if (err) {
> -				clear_inode_flag(inode, FI_NO_PREALLOC);
> -				inode_unlock(inode);
> -				ret = err;
> -				goto out;
> -			}
> +		if (is_inode_flag_set(inode, FI_NO_PREALLOC))
> +			goto write;
> +
> +		if (iocb->ki_flags & IOCB_DIRECT) {
> +			/* convert inline data for Direct I/O*/
> +			err = f2fs_convert_inline_inode(inode);
> +			if (err)
> +				goto out_err;
> +
> +			if (!f2fs_force_buffered_io(inode, iocb, from))
> +				goto write;
> +		}
> +		preallocated = true;
> +		target_size = iocb->ki_pos + iov_iter_count(from);
> +
> +		err = f2fs_preallocate_blocks(iocb, from);
> +		if (err) {
> +out_err:
> +			clear_inode_flag(inode, FI_NO_PREALLOC);
> +			inode_unlock(inode);
> +			ret = err;
> +			goto out;
>  		}
> +write:
>  		ret = __generic_file_write_iter(iocb, from);
>  		clear_inode_flag(inode, FI_NO_PREALLOC);
>  
> -- 
> 2.19.0.605.g01d371f741-goog
> 

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
