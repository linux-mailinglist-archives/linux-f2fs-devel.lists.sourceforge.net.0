Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E919A3FF881
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Sep 2021 02:56:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mLxVK-0002UZ-BS; Fri, 03 Sep 2021 00:56:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mLxVI-0002US-I9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Sep 2021 00:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=elMGajKsh7H6LzszukZ0t32XEFPXDfba5p0wP6VGPGs=; b=FHepQUpik8u5bhzhhdFCC4IiYz
 oYpVEKfmPtYa2koJe3uz0GT+0R/GnwNG8G+TLZ34XTyukdRzMyA70oGS6547e0kFY7u+xVh6jACPG
 vMd40L8Vp1iDewDLFHR62xm4PKh/4A0odlAJseIiGaQklX28Uur+48PM+RgrvRxFw0qU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=elMGajKsh7H6LzszukZ0t32XEFPXDfba5p0wP6VGPGs=; b=U
 vsGkWP/mES0E/+EQpHzzxqIWUh+jcq5k+GR3r72NSWAJqOpko3fZJeK77HPklPhiANiLM9xNiDZY8
 fpqUq4pVIzg8hlLy8h/WX9gmSqkrilkKJOC3UFXVUELzwfkNL5GrMdWwq11eKKBRFdYLrrapiZd3z
 7QW83WUCCIU1JwZ0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mLxVF-00COLe-Mo
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Sep 2021 00:56:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 6962A60F12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  3 Sep 2021 00:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630630571;
 bh=gcfKwid/+P0pDCK1/fFqB/8p6B9o3T705wCBk1TR17E=;
 h=From:To:Subject:Date:From;
 b=Ln+cDXJTeKbSPEmutHX2lAX5sUsmbIHje8vRcKnuWXSufo1Pk2HcckKSfTSDPb7Gb
 o1cIa9L244mnXsY3Ii9c3T0lfPBUS36MxUVqrjbWwPRM0kBfOJVjv1w5/7O7hB61BL
 wLrEDdK5G3ffeP5PaYUCVS8I0TQVtNN/5opx5CeIbcEKpMDKWRQRLqG5YHclIP0LkZ
 RLgm3UXaKtwAIt9SNl5hj2XVTLCiOKUsIsrdF6iugYJvZ7V0ysYZwJ+/ZUrWIojxA0
 TvEpFTKM8lWHjOqJwloAIcrF1OCnDCTZ4hbV7kAyvMdS2Bou8JEvm8tfavHJYfgSvj
 dW3wwjiIj1tPA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 54E96610F7; Fri,  3 Sep 2021 00:56:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 03 Sep 2021 00:56:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: zhuangyi1@huawei.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214299-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=214299 Bug ID:
 214299 Summary: A deadlock problem caused by the quota_sem set in db6ec53b7e0
 Product: File System Version: 2.5 Kernel Version: 5.3.0 Hardware: All OS:
 Linux Tree: Mainline Status: NEW Severi [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mLxVF-00COLe-Mo
Subject: [f2fs-dev] [Bug 214299] New: A deadlock problem caused by the
 quota_sem set in db6ec53b7e0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

https://bugzilla.kernel.org/show_bug.cgi?id=214299

            Bug ID: 214299
           Summary: A deadlock problem caused by the quota_sem set in
                    db6ec53b7e0
           Product: File System
           Version: 2.5
    Kernel Version: 5.3.0
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: zhuangyi1@huawei.com
        Regression: No

thread 1:                        thread 2:
f2fs_dquot_acquire
down_read(&sbi->quota_sem)
                                 f2fs_write_checkpoint
                                 block_operations
                                 f2fs_look_all
                                 down_write(&sbi->cp_rwsem)
f2fs_quota_write
f2fs_write_begin
__do_map_lock
f2fs_lock_op 
down_read(&sbi->cp_rwsem)        
                                 __need_flush_qutoa
                                 down_write(&sbi->quota_sem)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
