Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C97A622BF6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Nov 2022 13:56:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oskcw-0006q6-JR;
	Wed, 09 Nov 2022 12:56:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1oskcv-0006q0-44
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Nov 2022 12:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GTNiukvdmVEX624Zmnyr26/MIM/udwcsY8n5lP0GEyY=; b=MPPbOcOENFhnj/OZPLNUeZiLlF
 CW4TyLutWtsC0jah7r1iiVQ5jmBhYSnMvQUTlDJSt/sFTzWYxzsB2Ivpk0Di9MgqO2VqkDS0cucRS
 lgwDbD3zKT9E+4/5OLXVXdkTr4uSKy6xgmqxqIhLNgbXT4b3rxWjHs2ZYrl2m5tMzG+M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GTNiukvdmVEX624Zmnyr26/MIM/udwcsY8n5lP0GEyY=; b=Cs/qSXAKmz7l9fDxtEpttVxs1b
 3+mUZx9sSwJsa61SLV0Oh2pmkXcvH2ID4jqOCfOiaTKJmu6tuN8aAmKrgr+x6d0y+4o85FJ82HW0x
 UEFS5Gxn/B1ObpmY8qpiayvuVRJGMdNQCPAoVBDN/EySqUjmn4IMC4qRXRnIU+DApL5Y=;
Received: from mail-pj1-f47.google.com ([209.85.216.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oskcq-001uwO-Ri for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Nov 2022 12:56:20 +0000
Received: by mail-pj1-f47.google.com with SMTP id o7so16649819pjj.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 09 Nov 2022 04:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GTNiukvdmVEX624Zmnyr26/MIM/udwcsY8n5lP0GEyY=;
 b=W2sAs668yAZHQON+sGrMew9Ga87XXr6Rfgy6++hbXvoG906krQL+2ho0gF9x/VhqHf
 7ndUlQWKpI1br3LkAg7LPMdBxPfonmBv1Ln3EFj7Ux9xq1qtzODnhzOyg1BGb1N8vGo4
 l1mJrZ5B+h4dbGBw8dA5suc/XKVKA3XlDkyVZdJktaXJZJAshS9wy7cZzWCJhgcbiQlH
 Q21hZY/SdNXVZT31gmtCy7kpUP24Q4uErIQDO4eASPuBzqhMud89EHOGbD/l6D9CNsku
 rFuH7WQaG8G0FXCoP72ToAWwCbDFhovb62C5kO6ZwvuOZ8dRYtpPwZ1dUdLMflChHfNQ
 93DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GTNiukvdmVEX624Zmnyr26/MIM/udwcsY8n5lP0GEyY=;
 b=m8PDtOc8fVy0tAvh9GwO2TmBdHDjhA6dfwwkeW7l17fi8Vmvzw5cNkljpGKgM3v5Py
 dj1lbRqdHt/kTsXfYK+AD3zx+0BnjKWJImy+DARbJ1jeDL33xqHOHTNf8vduVNulMNm7
 yiGoPUa18dgTim83ZdKSugc6pcNA+EmCPJT0AFf4waj+k/z8EOa/KJrvpuiQNZ5OW1kj
 A0bXwqzrWP8+DtkletxN9NqT89tBPbZQYsABLW6gy/XVd9d6ESIG22Fsa+ih6wGV/G0I
 lW8Lrea+WuJiFRdik8wCqN9rcfRVLXaUbUqKLxOPD6RPlcTUUSnVEbHwyWDxLL9FFWG4
 ZB5g==
X-Gm-Message-State: ACrzQf128dJsIax4Are6PhF5xIaCTeqEeBrd8Iddsg1E+wElgc9CHlCS
 fi//S6BkIuVPHnYzZz4O5J0=
X-Google-Smtp-Source: AMsMyM53eSqqtxRqKKLKWJCtxP9QXYalWZH/XOh+/IkKGbyOf1NZXGDn3zLRV3CrVvL0I2gjsHEgww==
X-Received: by 2002:a17:90b:1d4d:b0:213:98e7:3b3 with SMTP id
 ok13-20020a17090b1d4d00b0021398e703b3mr61204947pjb.197.1667998571292; 
 Wed, 09 Nov 2022 04:56:11 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT ([43.224.245.252])
 by smtp.gmail.com with ESMTPSA id
 a19-20020aa794b3000000b0056c2e497ad6sm8503866pfl.93.2022.11.09.04.56.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Nov 2022 04:56:10 -0800 (PST)
Date: Wed, 9 Nov 2022 20:56:05 +0800
From: qixiaoyu <qxy65535@gmail.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20221109125605.GD22857@mi-HP-ProDesk-680-G4-MT>
References: <20221021023136.22863-1-qixiaoyu1@xiaomi.com>
 <af41e68c-4f78-0934-1041-974e44bd3825@kernel.org>
 <20221102122518.GB22857@mi-HP-ProDesk-680-G4-MT>
 <3d2b1141-995a-4bfb-4bf0-5227be25105a@kernel.org>
 <20221108123218.GC22857@mi-HP-ProDesk-680-G4-MT>
 <8368702c-ae33-b810-a6c3-ac8fa29998df@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8368702c-ae33-b810-a6c3-ac8fa29998df@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Nov 08, 2022 at 10:30:13PM +0800, Chao Yu wrote: >
 On 2022/11/8 20:32, qixiaoyu wrote: > >On Sun, Nov 06, 2022 at 09:54:59PM
 +0800, Chao Yu wrote: > >>On 2022/11/2 20:25, qixiaoyu wrote: > >>> [...]
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.47 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.47 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oskcq-001uwO-Ri
Subject: Re: [f2fs-dev] [PATCH] f2fs: separate IPU policy for fdatasync from
 F2FS_IPU_FSYNC
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, qixiaoyu1 <qixiaoyu1@xiaomi.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 08, 2022 at 10:30:13PM +0800, Chao Yu wrote:
> On 2022/11/8 20:32, qixiaoyu wrote:
> >On Sun, Nov 06, 2022 at 09:54:59PM +0800, Chao Yu wrote:
> >>On 2022/11/2 20:25, qixiaoyu wrote:
> >>>Hi Chao,
> >>>
> >>>fdatasync do in-place-update to avoid additional node writes, but currently
> >>>it only do that with F2FS_IPU_FSYNC as:
> >>>
> >>>f2fs_do_sync_file:
> >>>	if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)
> >>>  		set_inode_flag(inode, FI_NEED_IPU);
> >>>
> >>>check_inplace_update_policy:
> >>>	/* this is only set during fdatasync */
> >>>	if (policy & (0x1 << F2FS_IPU_FSYNC) &&
> >>>			is_inode_flag_set(inode, FI_NEED_IPU))
> >>>		return true;
> >>>
> >>>So this patch separate in-place-update of fdatasync from F2FS_IPU_FSYNC to
> >>>apply it to all IPU policy.
> >>>
> >>>BTW, we found small performance improvement with this patch on AndroBench app
> >>>using F2FS_IPU_SSR_UTIL on our product:
> >>
> >>How this patch affects performance when F2FS_IPU_SSR_UTIL is on?
> >>
> >>Thanks,
> >>
> >
> >SQLite test in AndroBench app use fdatasync to sync file to the disk.
> >When switch to F2FS_IPU_SSR_UTIL ipu_policy, it will use out-of-place-update
> >even though SQLite calls fdatasync, which will introduce extra meta data write.
> 
> Why not using F2FS_IPU_SSR_UTIL | F2FS_IPU_FSYNC, I guess these two flags
> cover different scenarios, F2FS_IPU_SSR_UTIL for ssr case, and F2FS_IPU_FSYNC
> for f{data,}sync case.
> 
> Thanks,
> 

As fsync(2) says:
fdatasync() is similar to fsync(), but does not flush modified metadata unless that
metadata is needed in order to allow a subsequent data retrieval to be correctly handled.

I think fdatasync should try to perform in-place-update to avoid unnecessary metadata
update whatever the ipu_policy is, and F2FS_IPU_FSYNC is used for fsync independently.

Thanks

> >
> >Thanks.
> >
> >>>
> >>>                 F2FS_IPU_FSYNC  F2FS_IPU_SSR_UTIL   F2FS_IPU_SSR_UTIL(with patch)
> >>>SQLite Insert(QPS)  6818.08     6327.09(-7.20%)     6757.72
> >>>SQLite Update(QPS)  6528.81     6336.57(-2.94%)     6490.77
> >>>SQLite Delete(QPS)  9724.68     9378.37(-3.56%)     9622.27
> >>>
> >>>Thanks
> >>>
> >>>On Tue, Nov 01, 2022 at 11:14:55PM +0800, Chao Yu wrote:
> >>>>On 2022/10/21 10:31, qixiaoyu1 wrote:
> >>>>>Currently IPU policy for fdatasync is coupled with F2FS_IPU_FSYNC.
> >>>>>Fix to apply it to all IPU policy.
> >>>>
> >>>>Xiaoyu,
> >>>>
> >>>>Sorry for the delay.
> >>>>
> >>>>I didn't get the point, can you please explain more about the
> >>>>issue?
> >>>>
> >>>>Thanks,
> >>>>
> >>>>>
> >>>>>Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
> >>>>>---
> >>>>>  fs/f2fs/data.c | 8 +++-----
> >>>>>  fs/f2fs/file.c | 4 +++-
> >>>>>  2 files changed, 6 insertions(+), 6 deletions(-)
> >>>>>
> >>>>>diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> >>>>>index a71e818cd67b..fec8e15fe820 100644
> >>>>>--- a/fs/f2fs/data.c
> >>>>>+++ b/fs/f2fs/data.c
> >>>>>@@ -2518,6 +2518,9 @@ static inline bool check_inplace_update_policy(struct inode *inode,
> >>>>>  	if (policy & (0x1 << F2FS_IPU_HONOR_OPU_WRITE) &&
> >>>>>  			is_inode_flag_set(inode, FI_OPU_WRITE))
> >>>>>  		return false;
> >>>>>+	/* this is set by fdatasync or F2FS_IPU_FSYNC policy */
> >>>>>+	if (is_inode_flag_set(inode, FI_NEED_IPU))
> >>>>>+		return true;
> >>>>>  	if (policy & (0x1 << F2FS_IPU_FORCE))
> >>>>>  		return true;
> >>>>>  	if (policy & (0x1 << F2FS_IPU_SSR) && f2fs_need_SSR(sbi))
> >>>>>@@ -2538,11 +2541,6 @@ static inline bool check_inplace_update_policy(struct inode *inode,
> >>>>>  			!IS_ENCRYPTED(inode))
> >>>>>  		return true;
> >>>>>-	/* this is only set during fdatasync */
> >>>>>-	if (policy & (0x1 << F2FS_IPU_FSYNC) &&
> >>>>>-			is_inode_flag_set(inode, FI_NEED_IPU))
> >>>>>-		return true;
> >>>>>-
> >>>>>  	if (unlikely(fio && is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
> >>>>>  			!f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
> >>>>>  		return true;
> >>>>>diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> >>>>>index 82cda1258227..08091550cdf2 100644
> >>>>>--- a/fs/f2fs/file.c
> >>>>>+++ b/fs/f2fs/file.c
> >>>>>@@ -270,8 +270,10 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
> >>>>>  		goto go_write;
> >>>>>  	/* if fdatasync is triggered, let's do in-place-update */
> >>>>>-	if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)
> >>>>>+	if (datasync || (SM_I(sbi)->ipu_policy & (0x1 << F2FS_IPU_FSYNC) &&
> >>>>>+			get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks))
> >>>>>  		set_inode_flag(inode, FI_NEED_IPU);
> >>>>>+
> >>>>>  	ret = file_write_and_wait_range(file, start, end);
> >>>>>  	clear_inode_flag(inode, FI_NEED_IPU);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
