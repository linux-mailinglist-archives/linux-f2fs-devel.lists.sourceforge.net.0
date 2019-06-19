Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6534AF78
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jun 2019 03:28:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdPP8-0000fx-Pq; Wed, 19 Jun 2019 01:28:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <kassey1216@gmail.com>) id 1hdPP7-0000fi-IR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jun 2019 01:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=96RvJEfG+k8hrSiE8jkURjf6ZeK+2iz7GDHsoqd+9MM=; b=MYARlPfmNUFNBVBzcfH9XDJG+D
 u7LuowyS0CKI3dwqB1WPukW7Gk4HROk5AvKKi2fNl8cPnm7F/lLBf/MtJC+4n3eqGMhoZ50EiXAYW
 /BrHfqBnWmQoZe5hiISkPAIMmt/PW/Zy4z2/fEUjkbK+5h+pe6H7rImvtetzRzOnNpW4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=96RvJEfG+k8hrSiE8jkURjf6ZeK+2iz7GDHsoqd+9MM=; b=a
 BT0WCsQizPRhavt0+K7vZIXHrEQ2auwO5DGVeERaj44ZKzA1/1yxsnmkwb9/WDq3jVyKoiXKIr5Xn
 Tws8Ph6kbiYj9D0E8e/xv95gWnFBB2hpkM6BlaMdSufOX845VayMaATmlp8qWGWd0BH3VyIIEMvu6
 Vk9OhU7XHqy69gSs=;
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hdPP3-004E7E-Ed
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jun 2019 01:28:49 +0000
Received: by mail-ot1-f48.google.com with SMTP id i8so17541483oth.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Jun 2019 18:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=96RvJEfG+k8hrSiE8jkURjf6ZeK+2iz7GDHsoqd+9MM=;
 b=OTDOJpyQ5KxKnhjOtSdRd3Ipg2OczCiCfCzpeHdxaQbtC50/mRsAkeb1nYm/CLxxxx
 BJTWqZu0shCRlaIPGeVxdL2GFPkuOJG9aI5TZbpua2SPwLT+X37J8yLka9HLGDZrH21d
 DLzov62/vOahZyJy2Qg/ctrE0uABB1uof353uKpw/NEWdenH03LHz3lqr81+ao+Y2Whn
 vI3GPRQQc9ZUBp919TNXQCg3mJnOLUg67td+QVJvsFOOdHigQmXgn1a+exQ7IYKc8mrV
 xwSsHzfTNIqSncMRGKSFQ2p90Fq9InMG7RiSXjdpgicvJa9ULnCM2pRUAf8Y2ypwqaQ3
 CDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=96RvJEfG+k8hrSiE8jkURjf6ZeK+2iz7GDHsoqd+9MM=;
 b=dBBn50Pq3IMKJo0mtYm1QGmawqMuSyI3/VqOiq3a2TS+PsfZU7fq0r/gZRUDSD7tDi
 y2PA8Zx4neAKfGi72wKaaAnkm1WUXenK6BZRQkELFvf0ovNWtG99NySwYFrF4G7bHt6s
 ph45l41MG+YNFKm/41l8D5GluWLfkoDZbKDPY8EMv0KQm/6tLS3HvMfUzVTKv3kM8rnd
 kBPlW+AqCvyQUyYL0sYC8K1gsUyyXBdDBLBpWbYx5zbxwB/RLJPLxxkx/fvATkV+N5a6
 mKcJqjZvkEV6bdBSRtmRfQy7oxaoak+7yegQ9r/RL7Q6/EZDkgBpP87/VVxZco8F4kCw
 nKnw==
X-Gm-Message-State: APjAAAVW7tBV+KBr+SJ6f6O81qXXygybI1M8Tzp/Szv6Fb760MDYk+J2
 8j76bkVvCQE60BATHDIUggCqq3xhsl3T/ZZSCrOfF0X4
X-Google-Smtp-Source: APXvYqwJFemHOZ6951TYnRmlzCgGcGJAhqynQ2dpOcgqEZcG4siRCIlLCOKryaaFM5IBQfb6TyUf3aCIniui1kpJEnM=
X-Received: by 2002:a9d:66c8:: with SMTP id t8mr9895921otm.94.1560907719530;
 Tue, 18 Jun 2019 18:28:39 -0700 (PDT)
MIME-Version: 1.0
From: Kassey <kassey1216@gmail.com>
Date: Wed, 19 Jun 2019 09:28:28 +0800
Message-ID: <CAKwPUoyvn6mjEw=DfPTpLBZy-NQvtd8fpjfpwRRGMvqshB5gxw@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net, Chao Yu <yuchao0@huawei.com>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, kassey@126.com
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (kassey1216[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.48 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (kassey1216[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hdPP3-004E7E-Ed
Subject: [f2fs-dev] f2fs: wait_on_all_pages_writeback 4.4 kernel
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

hi, Chao and team:
   we got dump on arm64 that showing a task is sleep on
wait_on_all_pages_writeback
  by checking the sbi->nr_pages, we can see that the value is negative
for F2FS_WB_CP_DATA
  caused the problem to wait .

  can you help to suggest if any reasaon that we are seeing negative
value here  ?

nr_pages = (
        (counter = 0),
        (counter = 30005),
        (counter = 0),
        (counter = 79),
        (counter = 0),
        (counter = 0),
        (counter = 9),
        (counter = -6),
        (counter = 6)),


-000|__switch_to(prev = 0xFFFFFFF74A1F8EC0, next = 0xFFFFFFF8B2C21D80)
-001|__schedule(preempt = FALSE)
-002|need_resched(inline)
-002|schedule()
-003|schedule_timeout(?)
-004|get_current(inline)
-004|io_schedule_timeout(timeout = 0x01F4)
-005|get_pages(inline)
-005|wait_on_all_pages_writeback(sbi = 0xFFFFFFF7A7323000)
-006|do_checkpoint(sbi = 0xFFFFFFF7A7323000, cpc = 0xFFFFFFF760C43C28)
-007|f2fs_write_checkpoint(sbi = 0xFFFFFFF7A7323000, cpc = 0xFFFFFFF760C43C28)
-008|f2fs_sync_fs(sb = 0xFFFFFFF887139800, ?)
-009|f2fs_do_sync_file(?, ?, ?, datasync = 0x0, atomic = TRUE)
-010|is_inode_flag_set(inline)
-010|f2fs_is_atomic_file(inline)
-010|f2fs_ioc_commit_atomic_write(inline)
-010|f2fs_ioctl(filp = 0xFFFFFFF811E4E3C0, ?, ?)
-011|f2fs_compat_ioctl(file = 0xFFFFFFF811E4E3C0, ?, ?)
-012|compat_sys_ioctl(fd = 0xA7, cmd = 0xF502, ?)
-013|oppo_root_check(asm)
-014|__sys_trace(asm)
-015|NSX:0xFFFFFFBFFE7FC7C0(asm)
 -->|exception
-016|NUR:0xEDD8236C(asm)
 ---|end of frame





-- 
Best regards
Kassey


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
