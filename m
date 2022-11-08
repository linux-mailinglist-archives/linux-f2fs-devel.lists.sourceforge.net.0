Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DD46210C7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Nov 2022 13:32:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1osNmQ-00085p-2m;
	Tue, 08 Nov 2022 12:32:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1osNmO-00085R-BC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Nov 2022 12:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NUYr0uhtmz7Dnti/gb7hA0lVz/+IZFhOgHoWke9hpfs=; b=QmR237iklYtaoQB3grMXj1JqGI
 8bu/5xzRYKHSAoYtJNZO336IO84Lr3zyKeitpkH8LEOQVGBnoKgFiQ2x2SeI4MOp9W38sByCrhV/w
 YXwkjIkY4UvjZzUvi1A6QX9a0uW1kKD9RxlwcAYBRTF1bAvKWo1kZCM8hFx2xmGN+5No=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NUYr0uhtmz7Dnti/gb7hA0lVz/+IZFhOgHoWke9hpfs=; b=MjaDL2XkM3eIubGX1T7AXkC4Pe
 qwz8nnZxzduIDOIJl/vsOKSl7BBFL++YRTxhprrfuhod4QofHKVcjti0t2k3gFdw6GV2Qe8z38Ks7
 x7ijCh2HejKNMnbI/V+F6mCKu25x4fnvysN+urGvopPCGgSc1p1fTT5G1Gm5P+3J/urs=;
Received: from mail-pg1-f175.google.com ([209.85.215.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1osNmL-0004HU-1e for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Nov 2022 12:32:36 +0000
Received: by mail-pg1-f175.google.com with SMTP id 136so9406291pga.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 08 Nov 2022 04:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NUYr0uhtmz7Dnti/gb7hA0lVz/+IZFhOgHoWke9hpfs=;
 b=F7h+vxYM4kEVjHFPpIHkcsuYTRyOIVUzvQBGMfVBRv7odRG+nvbVDUDuRp1SxCZ/iC
 OcsLOFXbBvC0CwcwJam2glhUuHm8ztg1LIinrYBA1ZrEVbZTFHS1lngrVmjrRNZfHH9Q
 wzWflT9JUUAaj7Stx/wpvCaqftVmke81do6wQ1aM0GghN46MpTyCNKjRtCz+ZNm4XlFA
 3G/g7LCQRwoHAainoBituog/tIa36Y51izwIwcVIWSqmRqT9543zPkPsQRDyGc6HsVED
 2wIcgBt/67hzTn8fYpG3OAxKzUk/aEYap9sfNKrcoWOlWa5wKI17s+W4oFHkWWMFgSHM
 eJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NUYr0uhtmz7Dnti/gb7hA0lVz/+IZFhOgHoWke9hpfs=;
 b=aWXirUqxompLpL/qK8iDPAuPolq5tRLe4Inyugd+s0D9nDHycDxs+bTPclpKdqk6fH
 ejIqWIVL4wOgnVmyuwgbX/p/S6zQSQOGmaGY+8YJRqraSy00MFD56bgyzZCLodnt15XF
 pH0qNyMVebiLZASAi5kCkQ0p/XA1UMdlNZtAveNGgwXAI4duGC/tGUKkDi+2Tl4YNlU1
 /wxMGNUZ8rPJDz2WrI+8fWlbKJ1530AeMuhaUHDu5B7hv71kzpQLYxr0a5xhmZBYi6vu
 a9M9Bx8IDMuyUWntJ00dGC+AIo8DdNGMWS0gtAXYsENWVV+bGmbsT3vJSAv/TW1m69eY
 7YWg==
X-Gm-Message-State: ACrzQf12CdXsgrJ4+K62zt4q38hZDU+xbRteW2kIBXrGlXd7pBaplh0q
 ywPIGEbY0a/HL7qgN91hfOU=
X-Google-Smtp-Source: AMsMyM44ldktGKrkRUR3+OvKbUI/a+XMYvRAljtU/1tdXrkuIdYaWw5oOC/eCkfzxYgRCuP9m8yekQ==
X-Received: by 2002:a63:e218:0:b0:448:5163:478f with SMTP id
 q24-20020a63e218000000b004485163478fmr48617512pgh.415.1667910747451; 
 Tue, 08 Nov 2022 04:32:27 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT ([43.224.245.252])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a170902768200b0017f72a430adsm6772212pll.71.2022.11.08.04.32.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Nov 2022 04:32:25 -0800 (PST)
Date: Tue, 8 Nov 2022 20:32:18 +0800
From: qixiaoyu <qxy65535@gmail.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20221108123218.GC22857@mi-HP-ProDesk-680-G4-MT>
References: <20221021023136.22863-1-qixiaoyu1@xiaomi.com>
 <af41e68c-4f78-0934-1041-974e44bd3825@kernel.org>
 <20221102122518.GB22857@mi-HP-ProDesk-680-G4-MT>
 <3d2b1141-995a-4bfb-4bf0-5227be25105a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d2b1141-995a-4bfb-4bf0-5227be25105a@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Nov 06, 2022 at 09:54:59PM +0800, Chao Yu wrote: >
 On 2022/11/2 20:25, qixiaoyu wrote: > >Hi Chao,
 > > > >fdatasync do in-place-update
 to avoid additional node writes, but currently > >it only [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.175 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.175 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1osNmL-0004HU-1e
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

On Sun, Nov 06, 2022 at 09:54:59PM +0800, Chao Yu wrote:
> On 2022/11/2 20:25, qixiaoyu wrote:
> >Hi Chao,
> >
> >fdatasync do in-place-update to avoid additional node writes, but currently
> >it only do that with F2FS_IPU_FSYNC as:
> >
> >f2fs_do_sync_file:
> >	if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)
> >  		set_inode_flag(inode, FI_NEED_IPU);
> >
> >check_inplace_update_policy:
> >	/* this is only set during fdatasync */
> >	if (policy & (0x1 << F2FS_IPU_FSYNC) &&
> >			is_inode_flag_set(inode, FI_NEED_IPU))
> >		return true;
> >
> >So this patch separate in-place-update of fdatasync from F2FS_IPU_FSYNC to
> >apply it to all IPU policy.
> >
> >BTW, we found small performance improvement with this patch on AndroBench app
> >using F2FS_IPU_SSR_UTIL on our product:
> 
> How this patch affects performance when F2FS_IPU_SSR_UTIL is on?
> 
> Thanks,
> 

SQLite test in AndroBench app use fdatasync to sync file to the disk.
When switch to F2FS_IPU_SSR_UTIL ipu_policy, it will use out-of-place-update
even though SQLite calls fdatasync, which will introduce extra meta data write.

Thanks.

> >
> >                 F2FS_IPU_FSYNC  F2FS_IPU_SSR_UTIL   F2FS_IPU_SSR_UTIL(with patch)
> >SQLite Insert(QPS)  6818.08     6327.09(-7.20%)     6757.72
> >SQLite Update(QPS)  6528.81     6336.57(-2.94%)     6490.77
> >SQLite Delete(QPS)  9724.68     9378.37(-3.56%)     9622.27
> >
> >Thanks
> >
> >On Tue, Nov 01, 2022 at 11:14:55PM +0800, Chao Yu wrote:
> >>On 2022/10/21 10:31, qixiaoyu1 wrote:
> >>>Currently IPU policy for fdatasync is coupled with F2FS_IPU_FSYNC.
> >>>Fix to apply it to all IPU policy.
> >>
> >>Xiaoyu,
> >>
> >>Sorry for the delay.
> >>
> >>I didn't get the point, can you please explain more about the
> >>issue?
> >>
> >>Thanks,
> >>
> >>>
> >>>Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
> >>>---
> >>>  fs/f2fs/data.c | 8 +++-----
> >>>  fs/f2fs/file.c | 4 +++-
> >>>  2 files changed, 6 insertions(+), 6 deletions(-)
> >>>
> >>>diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> >>>index a71e818cd67b..fec8e15fe820 100644
> >>>--- a/fs/f2fs/data.c
> >>>+++ b/fs/f2fs/data.c
> >>>@@ -2518,6 +2518,9 @@ static inline bool check_inplace_update_policy(struct inode *inode,
> >>>  	if (policy & (0x1 << F2FS_IPU_HONOR_OPU_WRITE) &&
> >>>  			is_inode_flag_set(inode, FI_OPU_WRITE))
> >>>  		return false;
> >>>+	/* this is set by fdatasync or F2FS_IPU_FSYNC policy */
> >>>+	if (is_inode_flag_set(inode, FI_NEED_IPU))
> >>>+		return true;
> >>>  	if (policy & (0x1 << F2FS_IPU_FORCE))
> >>>  		return true;
> >>>  	if (policy & (0x1 << F2FS_IPU_SSR) && f2fs_need_SSR(sbi))
> >>>@@ -2538,11 +2541,6 @@ static inline bool check_inplace_update_policy(struct inode *inode,
> >>>  			!IS_ENCRYPTED(inode))
> >>>  		return true;
> >>>-	/* this is only set during fdatasync */
> >>>-	if (policy & (0x1 << F2FS_IPU_FSYNC) &&
> >>>-			is_inode_flag_set(inode, FI_NEED_IPU))
> >>>-		return true;
> >>>-
> >>>  	if (unlikely(fio && is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
> >>>  			!f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
> >>>  		return true;
> >>>diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> >>>index 82cda1258227..08091550cdf2 100644
> >>>--- a/fs/f2fs/file.c
> >>>+++ b/fs/f2fs/file.c
> >>>@@ -270,8 +270,10 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
> >>>  		goto go_write;
> >>>  	/* if fdatasync is triggered, let's do in-place-update */
> >>>-	if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)
> >>>+	if (datasync || (SM_I(sbi)->ipu_policy & (0x1 << F2FS_IPU_FSYNC) &&
> >>>+			get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks))
> >>>  		set_inode_flag(inode, FI_NEED_IPU);
> >>>+
> >>>  	ret = file_write_and_wait_range(file, start, end);
> >>>  	clear_inode_flag(inode, FI_NEED_IPU);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
