Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BB66162A8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Nov 2022 13:25:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqCoI-0001m3-Pp;
	Wed, 02 Nov 2022 12:25:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1oqCoH-0001ls-AF
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 12:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=58xx+sO8s1GI8UUL6eW+tUVtsY0dtFpd6rNJ4ZqiKsk=; b=OfDWJrV1X7gMLUeMq7fh+28AL8
 7M8JrhbCHZk0b/SlllxXHczg1X96wtDPlZc2HkA9lZOPALiXLCP0hrLQyIvUIn9CvJm3zqgaJ1ghp
 sy3gLtTugYYi8y+ScT4jpRWmi3kC33rYRkQvR5Qf6gUE+S0wOSoJGEkdwS7UX1Z/VbxE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=58xx+sO8s1GI8UUL6eW+tUVtsY0dtFpd6rNJ4ZqiKsk=; b=Lhu/5LHf1RzGtilTUhdYqlk4nR
 5KXVpHL1EqQ9Az3Dhpmt5ldQJQR7PEqiQv5NgtbIGTD0OM5O/5F8Wp2+RAM6AhsMGSY3XrVK1+Qxf
 Fy9KlYOdSuAfOJcIlchQEjPCQMdvWscVYgqjUQSkbCHF+MuPCpw5cPQZL5rIWEsqgv8o=;
Received: from mail-pg1-f179.google.com ([209.85.215.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oqCoD-009LBG-4i for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 12:25:33 +0000
Received: by mail-pg1-f179.google.com with SMTP id 20so16108699pgc.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Nov 2022 05:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=58xx+sO8s1GI8UUL6eW+tUVtsY0dtFpd6rNJ4ZqiKsk=;
 b=R3u5jPUEbUOekWvq1vSz7ZHwVB36Qo9KCC8ixptsUYlqsi73HdjZtpBcQ23zXe2ZcD
 UgDGlPbm4x2p37sPIe+4JMDKgp1rt1QKp2J1dlQMaQ24zM7sWmLPNmnQdaIYO0B65ug6
 gTYWJEIYof555SGpkQZybMhLIMglpY7K+TACduyqaD7Q/Lama0DQbahobHN0EzyUyBxd
 AoL/0BrWfclbbmmOrcPN8BpLVd4wdUcZn9a9yKPTrp2RPwarNqv1oMdWuOtjv1bMmmGS
 6BNwmLloqDMPljtLr4YSaw3bVeD/xK9qYEAt1WVCyeZ68ZX40AGgjofb7/TM79u2fgnk
 6JnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=58xx+sO8s1GI8UUL6eW+tUVtsY0dtFpd6rNJ4ZqiKsk=;
 b=LEwsF/CEPQkYiNKjBD3SZ/zVKFmMN3pKOtlwNMorb31gFrWocvwLv7ewxedi47beMs
 kOOMr78U1DN/clnEHQmDCv+VB2Oo97gX0Uak8GpcZpM4bS1W9CwuKMkBWMFyqFBwZIck
 WAe9E7ul7XsF7Eb9AXhnph1eAOxkW5lRsIEbhl72QDJCD979NgphH8DxYmeLWCp5o/me
 yUseOCcWMps8SWaS+IzOE8O4vj6nlxCQjn7RI5nyK8Bc9aUF93cF7F5lGTAE3STB73I4
 JdlzLdwZ0wFnGpjBk11yf1nRHFcsVfI0CKXJdm1tzMaI5/uS0PrmReUiMKWyHI5AhwEc
 1/0A==
X-Gm-Message-State: ACrzQf0IGAI2qKR/jNxrLwhOTmZmDzH6OKTc95GoVOC8v5yfmpejMeQv
 idHfgnaQvQo6gcJgREe969o=
X-Google-Smtp-Source: AMsMyM6kamT90lEHu9yVNtu8a+fbcxQNr1HuzllJxFJlLy4f4XU94L/OYmF/OOA5+/jSK1N8KGuwIA==
X-Received: by 2002:a63:ed58:0:b0:439:b3a:4f01 with SMTP id
 m24-20020a63ed58000000b004390b3a4f01mr21467335pgk.327.1667391923529; 
 Wed, 02 Nov 2022 05:25:23 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G4-MT ([43.224.245.252])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a17090ae61300b00212e5068e17sm1328821pjy.40.2022.11.02.05.25.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Nov 2022 05:25:22 -0700 (PDT)
Date: Wed, 2 Nov 2022 20:25:18 +0800
From: qixiaoyu <qxy65535@gmail.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20221102122518.GB22857@mi-HP-ProDesk-680-G4-MT>
References: <20221021023136.22863-1-qixiaoyu1@xiaomi.com>
 <af41e68c-4f78-0934-1041-974e44bd3825@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af41e68c-4f78-0934-1041-974e44bd3825@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, fdatasync do in-place-update to avoid additional
 node writes,
 but currently it only do that with F2FS_IPU_FSYNC as: f2fs_do_sync_file:
 if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)
 set_inode_flag(inode, FI_NEED_IPU); 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.179 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.179 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oqCoD-009LBG-4i
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
Cc: qixiaoyu1 <qixiaoyu1@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

fdatasync do in-place-update to avoid additional node writes, but currently
it only do that with F2FS_IPU_FSYNC as:

f2fs_do_sync_file:
	if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)
 		set_inode_flag(inode, FI_NEED_IPU);

check_inplace_update_policy:
	/* this is only set during fdatasync */
	if (policy & (0x1 << F2FS_IPU_FSYNC) &&
			is_inode_flag_set(inode, FI_NEED_IPU))
		return true;

So this patch separate in-place-update of fdatasync from F2FS_IPU_FSYNC to
apply it to all IPU policy.

BTW, we found small performance improvement with this patch on AndroBench app
using F2FS_IPU_SSR_UTIL on our product:

                F2FS_IPU_FSYNC  F2FS_IPU_SSR_UTIL   F2FS_IPU_SSR_UTIL(with patch)
SQLite Insert(QPS)  6818.08     6327.09(-7.20%)     6757.72
SQLite Update(QPS)  6528.81     6336.57(-2.94%)     6490.77
SQLite Delete(QPS)  9724.68     9378.37(-3.56%)     9622.27

Thanks

On Tue, Nov 01, 2022 at 11:14:55PM +0800, Chao Yu wrote:
> On 2022/10/21 10:31, qixiaoyu1 wrote:
> >Currently IPU policy for fdatasync is coupled with F2FS_IPU_FSYNC.
> >Fix to apply it to all IPU policy.
> 
> Xiaoyu,
> 
> Sorry for the delay.
> 
> I didn't get the point, can you please explain more about the
> issue?
> 
> Thanks,
> 
> >
> >Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
> >---
> >  fs/f2fs/data.c | 8 +++-----
> >  fs/f2fs/file.c | 4 +++-
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> >
> >diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> >index a71e818cd67b..fec8e15fe820 100644
> >--- a/fs/f2fs/data.c
> >+++ b/fs/f2fs/data.c
> >@@ -2518,6 +2518,9 @@ static inline bool check_inplace_update_policy(struct inode *inode,
> >  	if (policy & (0x1 << F2FS_IPU_HONOR_OPU_WRITE) &&
> >  			is_inode_flag_set(inode, FI_OPU_WRITE))
> >  		return false;
> >+	/* this is set by fdatasync or F2FS_IPU_FSYNC policy */
> >+	if (is_inode_flag_set(inode, FI_NEED_IPU))
> >+		return true;
> >  	if (policy & (0x1 << F2FS_IPU_FORCE))
> >  		return true;
> >  	if (policy & (0x1 << F2FS_IPU_SSR) && f2fs_need_SSR(sbi))
> >@@ -2538,11 +2541,6 @@ static inline bool check_inplace_update_policy(struct inode *inode,
> >  			!IS_ENCRYPTED(inode))
> >  		return true;
> >-	/* this is only set during fdatasync */
> >-	if (policy & (0x1 << F2FS_IPU_FSYNC) &&
> >-			is_inode_flag_set(inode, FI_NEED_IPU))
> >-		return true;
> >-
> >  	if (unlikely(fio && is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
> >  			!f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
> >  		return true;
> >diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> >index 82cda1258227..08091550cdf2 100644
> >--- a/fs/f2fs/file.c
> >+++ b/fs/f2fs/file.c
> >@@ -270,8 +270,10 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
> >  		goto go_write;
> >  	/* if fdatasync is triggered, let's do in-place-update */
> >-	if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)
> >+	if (datasync || (SM_I(sbi)->ipu_policy & (0x1 << F2FS_IPU_FSYNC) &&
> >+			get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks))
> >  		set_inode_flag(inode, FI_NEED_IPU);
> >+
> >  	ret = file_write_and_wait_range(file, start, end);
> >  	clear_inode_flag(inode, FI_NEED_IPU);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
