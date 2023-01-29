Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8CA67FE74
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Jan 2023 12:18:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pM5i0-00077m-O8;
	Sun, 29 Jan 2023 11:18:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1pM5hy-00077g-W0
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 11:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=omrJDSj6uak8lt7vSvDidr6zPPBb1t+NRol4udkHRtM=; b=Rc3GN8klzY+V3rUNyqPXaK1yNP
 EUbserA4Eqa0BzSP6Nk3ZaTz3Skaf1I/7OapaghCB04FlA6K1t9m86gxoyYZk8NbCpEhVn3CpT2V8
 yTp/FgQtR7elGK5G4Akqqxmi5YlULMmiZ46SWSA0xOxJs51UH3EIio65Kp+EeUnWzkXY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=omrJDSj6uak8lt7vSvDidr6zPPBb1t+NRol4udkHRtM=; b=TNSsxq8EOGKA8ar/KJWIiUGY5v
 meWQx9JszdRN4c47XetR3xiMCoTChkQTFYH9CiySJORB29vN34Q9HvLQWHg+IsnuHtmdWwJlHCS1X
 Qr8UxsAAGsbeFSefAjerdxBgYEqvpACrcGTS/hVqwTuWjVY1kbPmOw8+iSIbUN+ONy7s=;
Received: from mail-pg1-f177.google.com ([209.85.215.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pM5hx-002QKR-NX for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 11:18:50 +0000
Received: by mail-pg1-f177.google.com with SMTP id 7so938028pgh.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 29 Jan 2023 03:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=omrJDSj6uak8lt7vSvDidr6zPPBb1t+NRol4udkHRtM=;
 b=EyaWTcCn7Bsl/JXXTDTZjAdnoGEfWi3WfaZm+IoPJG4o0AqOPrBFPXNSCDbc5SJsq/
 xy8Iuf5Z0eUFmNkuBrJDWxwQdUvVoTnTVp3qhM1ECcFv3AChBXa4wfVlUOtwofY2ULTH
 0PEuzaNw6OtswmD07pCeacFQGL4ecVKTbwLIa4WmpnPVwX8Nn/2x4/jhcMHwdiVCYXtN
 rMwjwJgdTCm99q1AyU/pXVX++bWznugJXUj3JEVWaWbxV+DOgfRMc1nyT5ujpOTiCXjU
 Ivn40iydNry3dh60D2sBFOkS6ibFJIIOZ226R3mXkfSq9jsnaVnNvMnmBJay1DxgMgpz
 +hag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=omrJDSj6uak8lt7vSvDidr6zPPBb1t+NRol4udkHRtM=;
 b=hYkBDgIlH1T3fRsEws8roL74pxvhUcr3QLUdEFEt3VsqZeMiL0dIseQq0u5zO9euU2
 Zl5XY7KStZg0yNgGnatpkgpfPziPBpcI326mo06X2zVutaZ1WLLS67JHAueuAHm28hPu
 0MmE0o8teoCOa7esB9be6D7gkm5uHJ0nYN7n70sG4R+AXkO3FNYbvVy0XtZf3LqiQtHO
 NrrfM3TiLEE4cs0kHPWZEn0K1LONcLFOQBkmwFE5wVPycGnY6dFsQ7ymAheI6J+kWgGW
 NvR33ZyxT4vUCFJV5GPa3hHn1+cmMjl4MAFDJ/tZ+MH1yhLBxfDuJKTUuGw++l9lvY6w
 EXLA==
X-Gm-Message-State: AO0yUKWsrupXowA+FxMDVJL0TeV7KNUVqsJATjU00NDNOhVsDCRmApGC
 kdQZyz52sijTpWY2vASYzU0=
X-Google-Smtp-Source: AK7set/z5jQFRQ4/hl+IlZ5xoVlXoweg5f07KqC/6rMEs7Uc5huhG0o2hdeSkM6GHB4Lq7WVgbgysw==
X-Received: by 2002:a05:6a00:1949:b0:593:954e:1b09 with SMTP id
 s9-20020a056a00194900b00593954e1b09mr5327761pfk.8.1674991123815; 
 Sun, 29 Jan 2023 03:18:43 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT ([43.224.245.237])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a626411000000b0058bbdaaa5e4sm5464492pfb.162.2023.01.29.03.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 03:18:43 -0800 (PST)
Date: Sun, 29 Jan 2023 19:18:37 +0800
From: qixiaoyu <qxy65535@gmail.com>
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Y9ZWDVV3HJ431Fis@mi-HP-ProDesk-680-G4-MT>
References: <20230113125859.15651-1-qixiaoyu1@xiaomi.com>
 <20230116030850.20260-1-qixiaoyu1@xiaomi.com>
 <7c12ebaa-4d3d-e475-dfb2-7b459cd26e64@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c12ebaa-4d3d-e475-dfb2-7b459cd26e64@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Jan 28, 2023 at 11:35:34AM +0800, Chao Yu wrote: >
 On 2023/1/16 11:08, qixiaoyu1 wrote: > > Currently we wrongly calculate the
 new block age to > > old * LAST_AGE_WEIGHT / 100. > > > > Fix it [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.177 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.177 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pM5hx-002QKR-NX
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs: fix wrong calculation of block
 age
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
Cc: xiongping1@xiaomi.com, qixiaoyu1@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Jan 28, 2023 at 11:35:34AM +0800, Chao Yu wrote:
> On 2023/1/16 11:08, qixiaoyu1 wrote:
> > Currently we wrongly calculate the new block age to
> > old * LAST_AGE_WEIGHT / 100.
> > 
> > Fix it to new * (100 - LAST_AGE_WEIGHT) / 100
> >                  + old * LAST_AGE_WEIGHT / 100.
> > 
> > Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
> > Signed-off-by: xiongping1 <xiongping1@xiaomi.com>
> > ---
> > Change log v1 -> v2:
> >   - fix udiv
> > 
> >   fs/f2fs/extent_cache.c | 7 ++-----
> >   1 file changed, 2 insertions(+), 5 deletions(-)
> > 
> > diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> > index 342af24b2f8c..ad5533f178fd 100644
> > --- a/fs/f2fs/extent_cache.c
> > +++ b/fs/f2fs/extent_cache.c
> > @@ -874,11 +874,8 @@ void f2fs_update_read_extent_tree_range_compressed(struct inode *inode,
> >   static unsigned long long __calculate_block_age(unsigned long long new,
> >   						unsigned long long old)
> >   {
> > -	unsigned long long diff;
> > -
> > -	diff = (new >= old) ? new - (new - old) : new + (old - new);
> > -
> > -	return div_u64(diff * LAST_AGE_WEIGHT, 100);
> > +	return div_u64(new, 100) * (100 - LAST_AGE_WEIGHT)
> > +		+ div_u64(old, 100) * LAST_AGE_WEIGHT;
> 
> How about updating as below to avoid lossing accuracy if new is less than 100?
> 
> return div_u64(new * (100 - LAST_AGE_WEIGHT), 100) +
> 		div_u64(old * LAST_AGE_WEIGHT, 100);
> 
> Thanks,
> 

We want to avoid overflow by doing the division first. To keep the accuracy, how
about updating as below:

	res = div_u64_rem(new, 100, &rem_new) * (100 - LAST_AGE_WEIGHT)
		+ div_u64_rem(old, 100, &rem_old) * LAST_AGE_WEIGHT;
	res += rem_new * (100 - LAST_AGE_WEIGHT) / 100 + rem_old * LAST_AGE_WEIGHT / 100;
	return res;

Thanks,

> >   }
> >   /* This returns a new age and allocated blocks in ei */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
