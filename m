Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD16B6D3561
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  2 Apr 2023 05:17:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pioDn-0005fl-23;
	Sun, 02 Apr 2023 03:17:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jyh429@gmail.com>) id 1pioDl-0005fe-HV
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Apr 2023 03:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o5rFwZN4arfT+quf2ScnUr6XHy1fT8u5eEhmQaaASlA=; b=mIrl3TN0s3+yjpngrpO8jNyGFQ
 FXZhrR2QKRYqPsH4y5ZSF4ImNXSq7yCkPhpHqL2A4852a3/b5CCB8/tBKJAa15Zmw7Y4d+pBb9eUr
 ztQ0+ergOFRsCqWESh7gGvVGfHvebn52heeQx8jcOb+ZwhRm++4LixvsDp0dRRpudGs0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o5rFwZN4arfT+quf2ScnUr6XHy1fT8u5eEhmQaaASlA=; b=KzXm73Mcq4Erg9RNykDz0FBUkY
 oe1GcDc5l5iRZoaRYE5nE8/5cWC1fZp++jhnYTVp08Haj5qMh01SumKXw+Yx8rnLgSJMr8zVaoQPR
 hIXfnS8bHBd0bhtZHTl8Q+aObemd1wez04pwIj8zmP+zDlz5LwuCcrX1Mu7ASOH5Hmc8=;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pioDj-00CRuc-Uj for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Apr 2023 03:17:32 +0000
Received: by mail-pl1-f177.google.com with SMTP id c18so25020147ple.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 01 Apr 2023 20:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680405446;
 h=thread-index:content-language:content-transfer-encoding
 :mime-version:message-id:date:subject:in-reply-to:references:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=o5rFwZN4arfT+quf2ScnUr6XHy1fT8u5eEhmQaaASlA=;
 b=UtJwdvLcUzjHvS4wnr5R9NIdmpRy6wBEEas5o3BT9o69hT5Vz08J0Zuf2ICuZD9XGG
 C5w0FvFlIKJYyQ1khXc2idyl4nDJpNL2DoxFyJH5saGIoyOr7OewMf1aCDzdN+iGeSx4
 qSaeYfjFQFmhgzZOrdkQtbU4RK/VJxaiY9Ch3UYq1v74Fu+IbGNMMAjkuPlt0y6hZ9+b
 v51xxp/pM2HcA5x/PHaLiqd1ryKNaiiqWZ4VeAXrpMYYykaBQ0N4whK64E8bz7Ec0dmH
 wcwh+nUVWttKWk1D7R+85oxMlbrqFLqnpn0nLSvAw852EkPidEIcGETuo7uXBHFspkIr
 U57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680405446;
 h=thread-index:content-language:content-transfer-encoding
 :mime-version:message-id:date:subject:in-reply-to:references:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o5rFwZN4arfT+quf2ScnUr6XHy1fT8u5eEhmQaaASlA=;
 b=iQAfjG4iFPi/bIXlRbdO6fZ9z1NGuhw72PIRatgRJsAUcKoaZ85mWMi0QBzZgge5aQ
 Yc/AXaIcfn0bv5K3P6uElO+pkVYlBlxWPsnUUIB2zTNsIgFwuiVCgB6BoXu9pP3TpCAl
 tUFLtMhiPt7CSxj+w3KnoIKb/nynAoRrUY4LiL34mwdUxx0zuIOgRTYHDa2I72emgqZH
 dCX57Wh2P62NCQHYzf1gizxHZTfCJzMayVPCJ1nTgsTBDM4oG4D9cRGNtdBxa2Z9YBYp
 giFLBQrKBBqYU3x1t5pwykTpzt7Hj7fXMO+n2BuetUtASb0QUCpLmU0uKbm1om79YLMA
 x4LA==
X-Gm-Message-State: AAQBX9dfRR8csDHX+fqIrd8dAwTuIiDXoU4ZBKvGJxg1lMUfDyMisvFp
 KYxwcQVRhmN3Z9GdUEAmLvo=
X-Google-Smtp-Source: AKy350YYP/el4R+46FhTkfdbpKa6uJ7uWQynmnEpS0NPC1S2v7kjvu2+wGLivgc7UCCGp6co5tmkaQ==
X-Received: by 2002:a17:903:1250:b0:1a2:55ca:6669 with SMTP id
 u16-20020a170903125000b001a255ca6669mr28198412plh.33.1680405446264; 
 Sat, 01 Apr 2023 20:17:26 -0700 (PDT)
Received: from DESKTOPB5TBVBT ([175.117.51.71])
 by smtp.gmail.com with ESMTPSA id
 bd10-20020a170902830a00b001991f3d85acsm3989098plb.299.2023.04.01.20.17.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 01 Apr 2023 20:17:25 -0700 (PDT)
From: "Yohan Joung" <jyh429@gmail.com>
To: "'Chao Yu'" <chao@kernel.org>,
	<jaegeuk@kernel.org>
References: <ZBzlJ36kO5KvxODB@google.com>
 <20230324130747.523-1-jyh429@gmail.com>
 <6db7be47-9455-c466-f99a-497f8fe8930a@kernel.org>
In-Reply-To: <6db7be47-9455-c466-f99a-497f8fe8930a@kernel.org>
Date: Sun, 2 Apr 2023 12:17:23 +0900
Message-ID: <004e01d96511$a65359b0$f2fa0d10$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Content-Language: ko
Thread-Index: AQF6XO6yHRdACLHpz3GwDztUEe2YOQJb5qXHAomEG4Svrj19UA==
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [jyh429[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.177 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.177 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jyh429[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pioDj-00CRuc-Uj
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix align check for npo2
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
Cc: oe-kbuild-all@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
 lkp@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> -----Original Message-----
> From: Chao Yu [mailto:chao@kernel.org]
> Sent: Saturday, April 1, 2023 10:49 AM
> To: Yohan Joung; jaegeuk@kernel.org
> Cc: lkp@intel.com; linux-kernel@vger.kernel.org; linux-f2fs-
> devel@lists.sourceforge.net; oe-kbuild-all@lists.linux.dev
> Subject: Re: [f2fs-dev] [PATCH] f2fs: fix align check for npo2
> 
> On 2023/3/24 21:07, Yohan Joung wrote:
> > Fix alignment check to be correct in npo2 as well
> >
> > Signed-off-by: Yohan Joung <yohan.joung@sk.com>
> > ---
> >   fs/f2fs/segment.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c index
> > 055e70e77aa2..f4a22a065277 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -1842,6 +1842,7 @@ static int __f2fs_issue_discard_zone(struct
> f2fs_sb_info *sbi,
> >   	sector_t sector, nr_sects;
> >   	block_t lblkstart = blkstart;
> >   	int devi = 0;
> > +	u32 remainder = 0;
> >
> >   	if (f2fs_is_multi_device(sbi)) {
> >   		devi = f2fs_target_device_index(sbi, blkstart); @@ -1857,9
> +1858,9
> > @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
> >   	if (f2fs_blkz_is_seq(sbi, devi, blkstart)) {
> >   		sector = SECTOR_FROM_BLOCK(blkstart);
> >   		nr_sects = SECTOR_FROM_BLOCK(blklen);
> > +		div_u64_rem(sector, bdev_zone_sectors(bdev), &remainder);
> 
> Should use div64_u64_rem()? As both sector and return value of
> bdev_zone_sectors() are u64.
> 
> Thanks,
Upload based on your comments.
Thanks
> 
> >
> > -		if (sector & (bdev_zone_sectors(bdev) - 1) ||
> > -				nr_sects != bdev_zone_sectors(bdev)) {
> > +		if (remainder || nr_sects != bdev_zone_sectors(bdev)) {
> >   			f2fs_err(sbi, "(%d) %s: Unaligned zone reset attempted
> (block %x + %x)",
> >   				 devi, sbi->s_ndevs ? FDEV(devi).path : "",
> >   				 blkstart, blklen);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
