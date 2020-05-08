Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C22A1CA844
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 May 2020 12:23:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LwBvdxCqHUIIF3+LfSj2tHHQ19CvokpGNhYWIAT0TWQ=; b=YRCzKUpzDqn5BmbwwZVeRH+3x
	7RNAU9a2IQMORPVdynnh94AZoIZtnbQKlPL5MZvnd9oCZSnNXGLZZPfKCNKObKWIVpqpgWTd/gEuE
	1nCW/Jj5XFGZF87ViaFMMaD+hgbCOVp/GLuxwAAi/lExU9LKbS3l1j+EtsYFoxVPwP4PY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jX0AH-00086w-6V; Fri, 08 May 2020 10:23:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@aol.com>) id 1jX0AF-00086N-Hj
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 10:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mLZbzqDVjv8e3oYQsLVwIRJfnDsYf81fgz2h1+WqMVY=; b=a+xlyMoixPIbn/z4KIrd8D4yfL
 ms1egf0Hm/pirsNae7Uz//zqlvsQ8O80aK62Pi+Tjck1izN6jOvptD/BDFjayY2Rhe8pgVDjboQHh
 wav+LDbQ1fYOpMsAMhNsmWaTFFVOYgjX6XF3x78LZFo3z/jnNkFatSLTKPnZPAQqFQdw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mLZbzqDVjv8e3oYQsLVwIRJfnDsYf81fgz2h1+WqMVY=; b=Rm6xFIE7zTHc2KioA0gg/igrvR
 XQeGeHikv4QNhPCRMeTy7d30OGCxQ3EpiAzrWrcmVAPGsRJj/36E1Ni805RpCLtPvV+isvaltnUUE
 iNcEbCH2h/OS11/FpzlYrgXnQhWM4T4NYABKFrh22D9Qfu7GPtBhuXNg6gcek31RSTd4=;
Received: from sonic303-21.consmr.mail.ne1.yahoo.com ([66.163.188.147])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jX0AD-00CMgr-KA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 10:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1588933403; bh=mLZbzqDVjv8e3oYQsLVwIRJfnDsYf81fgz2h1+WqMVY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject;
 b=FPXcRMvBkuTAHgxt6eUwgHiD19GpsXuDBhLhrQyEdNI4jk9QzV/fZyj+qU7S35t8lr9pSTrjXllqKNZd95RXO1UdC4FXf2kcFw0D5LO1+BCBuLCa2cJEHIpww+0E/e77BATKOQm5J9K5svQSAf6IykeictNqFI5v7ci15dYIsbLMS0LJZRdX7Vf3wqa9sS0ndGA4N2pStHhbbSfzj/CwwlEoRFHQKYvOPd0wZ/WGEtThb3Firb6O+yb4uWUaT+oH6Cx7+9dbalHyoau7KFodOo+id2UYmO2am4D9uuvkKtq9X5HFfLsBK1KRW5UmiXz35C0qLfqSlwH7hcZfIdgjrQ==
X-YMail-OSG: QPpm7UAVM1k7eW11nCV6kJD42efQiGBUMSp_OGpj.w.DFSedwuswbxVjMXjQEHP
 SNwcufnLy8_7fjvABCV.4g6KrDHxzyM7fgpYGeBNf73t73r5cehG1T71TMHhkjEpn5S5eUwhjokC
 ZCpe8eCeHzYmV857ZdaCCC4AfD9c1xFxMvKha6j5xHFtldibKESpgfzgBEeUnZ4LirAwRiytwU25
 WxIUqEY8aJRndJ0iG2JvvBqEnDAh9vnwgWk9p1erHcqE2julIoc_sdeEptXzc48mGnEyA7MHzXsO
 BasnqQHPkZ5U7sRgYkSoQonXhIp96vAc5ksUuOLvylCQsdyiq82K4ZcFo6_urM9HKWG.6KLmXQKa
 RjREr1yXNFxjjdMIssXSMwPnwwI4K7kd74Dvq5Yw8CubolxYkjo5VJQ2pe1Gs2tuj9WSD7ZckuhF
 zP8jZ4eAbWSVwPt__iAYpgtSES.mIMKfB6F6UXKvvqJD.k4z0F.gMD10EmNviCEQW7DD3CX6pfc9
 lfxeYZCFR7OAja3Oifx0EZC53Ya7.8uDC79_bTAdGc189IjVwZgz6ZnOiP8z7O1moTfRTtLfEXkl
 rVIbq_3EcoXIDTQzXSdgNk.FV6TAkpBOTohHCb9Lm6QNmfoL.z3GKmgE5k77Ctxyz2SpTkYTwfB5
 23XGs2AihKOmrh5qYS06DMj7YspdGIns0Br4plnQbC_CYKXn_iGYrgtiTPTz.tKD58NuBCpykdJZ
 Cc_XJBYZEqAm9JWkJB4SU0mDIABiwBWavlmN.A38hEeJ.Iik75aXOKl_zrp.HnHrR7bo8vCBh_Fe
 ZP7pVi6m1Ub1EZmE2kj2XDbneAuAtlEEQEFO0MAN4ruEza.geHHRdBxXOmckEBg8Gk_7boNYxS7h
 utjhlyY2dTOqRbBbPSgIYe7.gad2BPEkomNMkizuu4z03L9_sD8bvEmdrivSeHQ0MPmOw4xEU28N
 pjNClL1XYP8YKPR5Z9aiuunCJ81Hsn7QNwhk53BvArl1VFIWZADLyUubnbrrheZVke0YXckq20ml
 LB.d8wZAfTCLm4R1IynbLlASZ37fSY_4NEZZV5QmwA2YKK4F522JABvJbBe40Rf_OSUmNmlp0QBf
 NbFYsgxd08POY_KFpMjygWmMoD5_tZQFoFh2ObjEWcaetL0RDy4CKNOQVRCf5u7__W.A4mFu4Zdj
 2rriablvRmordQWzfRMgbSRbrlr7Rq6FzaqgF_chLCf.Q.7sM3NHSgsYubLL9vqKMiZhUibky8NK
 3_EsBxOLuYC6boFStP9x.Qh8LjMTbNo_z5SgB05ZMXWiGck3d.mSxMbHyGtKZqsTtb4CzbJ7r66W
 IyR.zwBrWrMQ67QXyAbbkQjQj4h9CqdXRYFF_oVvUUUdXfpMt_FJCWDqpWiWci0gCiIS_RpeKUY1
 p9INsrWQLiQG3HlPzgJsu8wK_z02w5cKv
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.ne1.yahoo.com with HTTP; Fri, 8 May 2020 10:23:23 +0000
Received: by smtp431.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 72c80166a945fbda854cadf4314d8de0; 
 Fri, 08 May 2020 10:23:21 +0000 (UTC)
Date: Fri, 8 May 2020 18:23:14 +0800
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200508102306.GA18849@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20200508094709.40048-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200508094709.40048-1-yuchao0@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailer: WebService/1.1.15902 hermes Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hsiangkao[at]aol.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [66.163.188.147 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [66.163.188.147 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jX0AD-00CMgr-KA
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: allow lz4 to compress data
 partially
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
From: Gao Xiang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Gao Xiang <hsiangkao@aol.com>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

On Fri, May 08, 2020 at 05:47:09PM +0800, Chao Yu wrote:
> For lz4 worst compress case, caller should allocate buffer with size
> of LZ4_compressBound(inputsize) for target compressed data storing.
> 
> However lz4 supports partial data compression, so we can get rid of
> output buffer size limitation now, then we can avoid 2 * 4KB size
> intermediate buffer allocation when log_cluster_size is 2, and avoid
> unnecessary compressing work of compressor if we can not save at
> least 4KB space.
> 
> Suggested-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/compress.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 5e4947250262..23825f559bcf 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -228,7 +228,12 @@ static int lz4_init_compress_ctx(struct compress_ctx *cc)
>  	if (!cc->private)
>  		return -ENOMEM;
>  
> -	cc->clen = LZ4_compressBound(PAGE_SIZE << cc->log_cluster_size);
> +	/*
> +	 * we do not change cc->clen to LZ4_compressBound(inputsize) to
> +	 * adapt worst compress case, because lz4 algorithm supports partial
> +	 * compression.

Actually, in this case the lz4 compressed block is not valid (at least not ended
in a valid lz4 EOF), and AFAIK the current public lz4 API cannot keep on
compressing this block. so IMO "partial compression" for an invalid lz4
block may be confusing.

I think some words like "because lz4 implementation can handle output buffer
budget properly" or similar stuff could be better.

The same to the patch title and the commit message.

Thanks,
Gao Xiang


> +	 */
> +	cc->clen = cc->rlen - PAGE_SIZE - COMPRESS_HEADER_SIZE;
>  	return 0;
>  }
>  
> @@ -244,11 +249,9 @@ static int lz4_compress_pages(struct compress_ctx *cc)
>  
>  	len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
>  						cc->clen, cc->private);
> -	if (!len) {
> -		printk_ratelimited("%sF2FS-fs (%s): lz4 compress failed\n",
> -				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id);
> -		return -EIO;
> -	}
> +	if (!len)
> +		return -EAGAIN;
> +
>  	cc->clen = len;
>  	return 0;
>  }
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
