Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 872B24EE2C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jun 2019 19:51:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1heNhO-0005OE-MD; Fri, 21 Jun 2019 17:51:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1heNhN-0005O1-EF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 17:51:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xeNRrxlJXX7Udcles47S5Xfl7tvx4hiD8l8hcmdoC2I=; b=Kr2ompyUedN3rEtG+v85ynNSWq
 hhTl2OfpcSxe7tqtRXj4i26ntEvtIMInnPs+Zf2rM3Bi6LYrbSyI2cSQ+9uZTBjDuR4uuKlCwyomj
 ylr6B/gIUnhWSedz8ETI17F3YQaHRQ/6nN10dv0tydr0kUVPai8v46n7Nt7Z42oOwQw4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xeNRrxlJXX7Udcles47S5Xfl7tvx4hiD8l8hcmdoC2I=; b=jLwPvi0j6Jr4pgGrSTQLgFaSYa
 vQA/WV9aRe4+sub1VJWp4XAdPjeQy6imv9glAmbBAT7dKGuoQAO171xiIIGH4iESu6pZ4ssM//M46
 AjO3MQxSP6oW8hzZuYO3QpoFddJ5kViKfi1nzumcyhZphb6MCg24PDxT6sndgM4WmQ7A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1heNhP-003BYG-FZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 17:51:45 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E919A2083B;
 Fri, 21 Jun 2019 17:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561139497;
 bh=jJvdZMIzFOYihq8G0IJrmVGkbRXISz28GVQ1tYAdqJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nnaUpFyFaR4Da7YBwNkpjsNestIElhyOrBDDr608Zr8kSijiqr2uR2FZc3SwWk2DW
 SvtkpUSrpPOcl6rUXUMzlGuHPk6wIZRkMmoa9GXK9EMq7T3wu0lH/TQWrz9fKySJdb
 sRKaWS3b0OQ0lma6rAalWgVLJklKJE4BuI2jo2A8=
Date: Fri, 21 Jun 2019 10:51:35 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190621175135.GC79502@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190530033115.16853-1-jaegeuk@kernel.org>
 <20190530175714.GB28719@jaegeuk-macbookpro.roam.corp.google.com>
 <20190604183619.GA8507@jaegeuk-macbookpro.roam.corp.google.com>
 <2afe0416-fe2d-8ba8-7625-0246aca9eba6@huawei.com>
 <20190614024655.GA18113@jaegeuk-macbookpro.roam.corp.google.com>
 <6f70ae56-45eb-666d-ae55-48eb0cc96f32@huawei.com>
 <20190619172651.GB57884@jaegeuk-macbookpro.roam.corp.google.com>
 <ba6555c9-b864-d0cc-1c65-4077e7f15175@huawei.com>
 <20190621173807.GB79502@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190621173807.GB79502@jaegeuk-macbookpro.roam.corp.google.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1heNhP-003BYG-FZ
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add a rw_sem to cover quota flag
 changes
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/21, Jaegeuk Kim wrote:
> On 06/20, Chao Yu wrote:
> > On 2019/6/20 1:26, Jaegeuk Kim wrote:
> > > On 06/18, Chao Yu wrote:
> > >> On 2019/6/14 10:46, Jaegeuk Kim wrote:
> > >>> On 06/11, Chao Yu wrote:
> > >>>> On 2019/6/5 2:36, Jaegeuk Kim wrote:
> > >>>>> Two paths to update quota and f2fs_lock_op:
> > >>>>>
> > >>>>> 1.
> > >>>>>  - lock_op
> > >>>>>  |  - quota_update
> > >>>>>  `- unlock_op
> > >>>>>
> > >>>>> 2.
> > >>>>>  - quota_update
> > >>>>>  - lock_op
> > >>>>>  `- unlock_op
> > >>>>>
> > >>>>> But, we need to make a transaction on quota_update + lock_op in #2 case.
> > >>>>> So, this patch introduces:
> > >>>>> 1. lock_op
> > >>>>> 2. down_write
> > >>>>> 3. check __need_flush
> > >>>>> 4. up_write
> > >>>>> 5. if there is dirty quota entries, flush them
> > >>>>> 6. otherwise, good to go
> > >>>>>
> > >>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > >>>>> ---
> > >>>>>
> > >>>>> v3 from v2:
> > >>>>>  - refactor to fix quota corruption issue
> > >>>>>   : it seems that the previous scenario is not real and no deadlock case was
> > >>>>>     encountered.
> > >>>>
> > >>>> - f2fs_dquot_commit
> > >>>>  - down_read(&sbi->quota_sem)
> > >>>> 					- block_operation
> > >>>> 					 - f2fs_lock_all
> > >>>> 					  - need_flush_quota
> > >>>> 					   - down_write(&sbi->quota_sem)
> > >>>>   - f2fs_quota_write
> > >>>>    - f2fs_lock_op
> > >>>>
> > >>>> Why can't this happen?
> > >>>>
> > >>>> Once more question, should we hold quota_sem during checkpoint to avoid further
> > >>>> quota update? f2fs_lock_op can do this job as well?
> > >>>
> > >>> I couldn't find write_dquot() call to make this happen, and f2fs_lock_op was not
> > >>
> > >> - f2fs_dquot_commit
> > >>  - dquot_commit
> > >>   ->commit_dqblk (v2_write_dquot)
> > >>    - qtree_write_dquot
> > >>     ->quota_write (f2fs_quota_write)
> > >>      - f2fs_lock_op
> > >>
> > >> Do you mean there is no such way that calling f2fs_lock_op() from
> > >> f2fs_quota_write()? So that deadlock condition is not existing?
> > > 
> > > I mean write_dquot->f2fs_dquot_commit and block_operation seems not racing
> > > together.
> > 
> > quota ioctl has the path calling write_dquot->f2fs_dquot_commit as below, which
> > can race with checkpoint().
> > 
> > - do_quotactl
> >  - sb->s_qcop->quota_sync (f2fs_quota_sync)
> >   - down_read(&sbi->quota_sem);      ----  First
> >    - dquot_writeback_dquots
> >     - sb->dq_op->write_dquot (f2fs_dquot_commit)
> > 							- block_operation can race here
> >      - down_read(&sbi->quota_sem);   ----  Second
> 
> Adding f2fs_lock_op() in f2fs_quota_sync() should be fine?

Something like this?

---
 fs/f2fs/super.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 7f2829b1192e..1d33ca1a8c09 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1919,6 +1919,17 @@ int f2fs_quota_sync(struct super_block *sb, int type)
 	int cnt;
 	int ret;
 
+	/*
+	 * do_quotactl
+	 *  f2fs_quota_sync
+	 *  down_read(quota_sem)
+	 *  dquot_writeback_dquots()
+	 *  f2fs_dquot_commit
+	 *                            block_operation
+	 *                            down_read(quota_sem)
+	 */
+	f2fs_lock_op(sbi);
+
 	down_read(&sbi->quota_sem);
 	ret = dquot_writeback_dquots(sb, type);
 	if (ret)
@@ -1958,6 +1969,7 @@ int f2fs_quota_sync(struct super_block *sb, int type)
 	if (ret)
 		set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
 	up_read(&sbi->quota_sem);
+	f2fs_unlock_op(sbi);
 	return ret;
 }
 
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
