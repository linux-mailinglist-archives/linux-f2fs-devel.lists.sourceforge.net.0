Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C531121F4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Dec 2019 05:01:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1icLr9-0001iX-EY; Wed, 04 Dec 2019 04:01:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=234f285ce=shinichiro.kawasaki@wdc.com>)
 id 1icLr8-0001iJ-1l
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Dec 2019 04:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L4dBs8+mtj+LYeVUCfYtGpCr/TKNhd/JtzLruwdYEs4=; b=h/7yHZYu1D1o2eelTXqgICBVc6
 rA7igwLkFa/Mrh1yFxNP/YJbTbty4hlIsp6IGX2Roib37IySmDLSOoK9i7d7+YjvBbhwknkzDmgwH
 OTUujsJk+WJAshTRkF9dD8gUgWiId2vMfe7YLXpViaXOesSldmqfgmdqS66p1tljCj8c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L4dBs8+mtj+LYeVUCfYtGpCr/TKNhd/JtzLruwdYEs4=; b=Vn8H5tpG3ctDI6fWRCdHCCbhd+
 ykgJysbMvliCFOqaRNB5/43zp6PNLV3HVrM2KEbTHW0wxAmTsn3oOyvHWqkwvqJ00edMlE6f8Gz8w
 jVzVv45w0uDKwizsEyHyvRWqctqwUBTKLAzkNGkeeDMGdPdEAb2Crz7QtBw4KcibGz3U=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1icLr3-003ZGm-Cp
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Dec 2019 04:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1575432094; x=1606968094;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NRLBclJoZbwvO/Dd3yZVRQhiyU4z+Y6vrETuZt0iLrc=;
 b=YC7KbEfu+HBnjepPgRleI5epnEQSAakSWdBpwsUNWrAFk1vEV2xpfq1f
 58jZeF15z/mQUKxWJCjmwCPmYsEW2YnitEQeQcWTlbbsTyKvptK9+s0FT
 nNqo+PaYQpU4DvITPFNDGcZZlU0jIXn9l2nbcy+o/yet1CLfSYe8iZn8Y
 32U+ctGFHIvktjjpoWdnkmsTfJ2H52h5wkixSifUqronpSjUezOcu77xl
 uB5vP1oyVHWywcBa7/h4iT2yvRxPlRJfAb+qBhMKHBnQANietqjZZ/54/
 go5uVdWZiV3EtIg5te/I5eoA5Uy+HUquHPdbA0+voGLJpSSSXOcF2KX+S g==;
IronPort-SDR: vHvQYExHywA1oC7SBbhjnXOfKUD2GJuZu01n6VlBAwCtKtJ615qyMrecXOMjFheoI8YuRwnKtJ
 Peu+M/nB8MAIYQKRJgmh34eoTFsastKrujvyczgPLgEUtXKTuGsvyBFLmp91D6RB5csTSdDxZe
 tBU+Fs4MXSQ0LCNIzSgo+IVM0bd89Vk+eldx0lzRmn/c25W0dYGoCMbIBy6nBOLzrzCKe+akqm
 90E+BSz+7jUrweLa1TDVVic+E6kmHx32n10NZRZ8rG+E95NtVemgai1nnm9I0CoiMrUWgdeeuS
 8MI=
X-IronPort-AV: E=Sophos;i="5.69,275,1571673600"; d="scan'208";a="126173766"
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hgst.iphmx.com with ESMTP; 04 Dec 2019 12:01:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfzSajt6fbYTg05T2IFup/R02ncKEhcyaP4FPxmUwr69v3SHSATK4+Rak5mmgEMOIoQQ7QNL5orpkgWGZLLJYJmM4tRZ8CiakvNAjdjSbpWvKs6/9/NOlkg0VHwmx2LxI2dyGQRgclzBfCEo46wWao1W9RTbk6lqQKX0nf7NHbyOc4ty7qgxNIDxFTlN4K4kb8mQAvrwGBtuJ9KR6tiIIDtZzdBx8ev00UN6QBM456jhyNZ1uIlvJYVzJqdd/Jr33VjPCItqLEb8Tgo2R3H3cCpJHOLqJ5rKJUUo9tx5rmT4VOaWQtafQFXXEYhIJTFBcQjCWMYVuWyHDsZ9/mqXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4dBs8+mtj+LYeVUCfYtGpCr/TKNhd/JtzLruwdYEs4=;
 b=liNGdfW5j9bVfVgUbASswmv1jeiH7mi2WLeeBskEh3MCGB23LA4LNXPAZdkZLTqOLDqRfn4EYsFhui3R0VN+aICozDShRnS1T2RRl/tv6NS7bj0ZS9zTn1vfzUbvmEwv6rq1ihkBnimm5b13OUSMKBjGtwOfTRpa5Gfl6YB2xnEPePcfq+tu56h3rLj2a0MobrSIQ35jaqmnj/uIDneBrslECIyqg2QP0Anzx4i9t6Boh7X0RANlbV3TnhNb3RQvGR5voU42uw+x1lGixLlCmx/E0JSGeOq6IAjBZuouI8S8ffkVdL53L3SOuBvdC8hfXYBzbDW/Stf6mTrLW0oSOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4dBs8+mtj+LYeVUCfYtGpCr/TKNhd/JtzLruwdYEs4=;
 b=HBbPfCl4BlAl2zip8g32AcCFIkRIjfTjTZvhlyOu/RHQOK2TXDd0ps7X87+PBLDgyIa03VM4S3U0wAoek13DFg/RipXgw4O/I1bogmFMoYAmiU38sI4eWj3QeBAPAgi6Q9hoKQKMXTwF24UW5zuHCAtLQxhnGh3p/xI0x+hOqOI=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2298.namprd04.prod.outlook.com (10.167.8.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Wed, 4 Dec 2019 04:01:21 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::ac1b:af88:c028:7d74%11]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 04:01:20 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [PATCH v2] f2fs: Fix direct IO handling
Thread-Index: AQHVqf/EcUMid82cv0W5f8BjBRO52KepWvgA
Date: Wed, 4 Dec 2019 04:01:20 +0000
Message-ID: <20191204040120.gwcfglulpnlywc47@shindev.dhcp.fujisawa.hgst.com>
References: <20191126075719.1046485-1-damien.lemoal@wdc.com>
 <20191126234428.GB20652@jaegeuk-macbookpro.roam.corp.google.com>
 <20191203173308.GA41093@jaegeuk-macbookpro.roam.corp.google.com>
In-Reply-To: <20191203173308.GA41093@jaegeuk-macbookpro.roam.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6cd1789e-fec7-419d-f7b8-08d7786e9f40
x-ms-traffictypediagnostic: CY1PR04MB2298:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2298AE162C66534BB3703EEFED5D0@CY1PR04MB2298.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0241D5F98C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(189003)(199004)(53546011)(6506007)(25786009)(9686003)(11346002)(71190400001)(76176011)(6512007)(81166006)(14444005)(256004)(66446008)(76116006)(3846002)(6116002)(8676002)(99286004)(66476007)(64756008)(229853002)(5660300002)(66556008)(91956017)(1076003)(6246003)(4326008)(7736002)(305945005)(102836004)(14454004)(71200400001)(26005)(86362001)(66946007)(6436002)(2906002)(478600001)(316002)(446003)(186003)(8936002)(6486002)(44832011)(54906003)(81156014)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2298;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cPHlhWbR+s4JMyrbEb2iu4hqfblc6eT5uAuOvKWWJX4Sf5G0M2jQV9cPQNRJOux9/vCMrQVLZQpx6HNMws4+XYW3nA1LiUVyCPHWOsVcf5mF/gxrc/YuRMfpW1MtabXKthyndq7SDN4tnnLL9tKXTo6DaFNDYGWIshp2LptlhbWIFu1WozD/CHIWnbm4yLV10uCMwEBlybinec0GIZAKJSOzwhNvzVzmTHit1hJWFHf2ZNJ8hMBQaA9Ehtsd6ZPkHvia70Cw+kctr4tEe/iwTmH1OdPInzD4wEeGQgZgDxMFj53hLHX8XwMU0XS1e9qo8CWDE7mtj4WKHx6ApFl/dQLyJfG27YkKYVxqhhyQosFenrPGJ+0sw6+5gFcsxguLg8xb9YzJ+JjslrHrZrN/ixJTpLHIBdLL6A4wjiDPmmrHTPg4ICdNIpGMAiqLIYyT
Content-ID: <F4642912A1089F4E859D707B968C3FE1@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd1789e-fec7-419d-f7b8-08d7786e9f40
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2019 04:01:20.7996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VX2aMjOzrg/T/ODQg9pnbIIE+gVoDXBclFxcXmgWDy8bA0iqfbV28gjw5auWm6TbvcfMHv+uIZ44jtQv3mR/9F1PVOVrb5j92uWEKwjqDBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2298
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: javigon.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1icLr3-003ZGm-Cp
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Fix direct IO handling
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

On Dec 03, 2019 / 09:33, Jaegeuk Kim wrote:
> Thank you for checking the patch.
> I found some regressions in xfstests, so want to follow the Damien's one
> like below.
> 
> Thanks,
> 
> ===
> From 9df6f09e3a09ed804aba4b56ff7cd9524c002e69 Mon Sep 17 00:00:00 2001
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> Date: Tue, 26 Nov 2019 15:01:42 -0800
> Subject: [PATCH] f2fs: preallocate DIO blocks when forcing buffered_io
> 
> The previous preallocation and DIO decision like below.
> 
>                          allow_outplace_dio              !allow_outplace_dio
> f2fs_force_buffered_io   (*) No_Prealloc / Buffered_IO   Prealloc / Buffered_IO
> !f2fs_force_buffered_io  No_Prealloc / DIO               Prealloc / DIO
> 
> But, Javier reported Case (*) where zoned device bypassed preallocation but
> fell back to buffered writes in f2fs_direct_IO(), resulting in stale data
> being read.
> 
> In order to fix the issue, actually we need to preallocate blocks whenever
> we fall back to buffered IO like this. No change is made in the other cases.
> 
>                          allow_outplace_dio              !allow_outplace_dio
> f2fs_force_buffered_io   (*) Prealloc / Buffered_IO      Prealloc / Buffered_IO
> !f2fs_force_buffered_io  No_Prealloc / DIO               Prealloc / DIO
> 
> Reported-and-tested-by: Javier Gonzalez <javier@javigon.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Tested-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Using SMR disks, I reconfirmed that the reported problem goes away with this
modified patch also. Thanks.

> ---
>  fs/f2fs/data.c | 13 -------------
>  fs/f2fs/file.c | 43 +++++++++++++++++++++++++++++++++----------
>  2 files changed, 33 insertions(+), 23 deletions(-)
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
> index c0560d62dbee..0e1b12a4a4d6 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3386,18 +3386,41 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
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
> +			/*
> +			 * Convert inline data for Direct I/O before entering
> +			 * f2fs_direct_IO().
> +			 */
> +			err = f2fs_convert_inline_inode(inode);
> +			if (err)
> +				goto out_err;
> +			/*
> +			 * If force_buffere_io() is true, we have to allocate
> +			 * blocks all the time, since f2fs_direct_IO will fall
> +			 * back to buffered IO.
> +			 */
> +			if (!f2fs_force_buffered_io(inode, iocb, from) &&
> +					allow_outplace_dio(inode, iocb, from))
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
> 

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
