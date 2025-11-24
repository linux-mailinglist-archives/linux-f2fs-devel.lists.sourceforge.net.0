Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9E3C7ED6D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 03:58:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=826c7FYOoZRihqMKJD9QYc3km7w0Vj329wW4xqreoCk=; b=VViw2m56m/iz+ebiWFjWnyR9Pm
	YXgdLG9kYX7IVBh6mA87Q7qGLkd4qqJm7AI7K63o2hCewY6RmThBLSeOOvOJkpJeUeuH59GeSZYLv
	oXn0h8r2tHRrHTsNWnj76jKVRoMP7AIXyIYme5OgUDFzIxxqBfZ0hzl3N1e5YY6aoXjI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNMm8-00027x-Ql;
	Mon, 24 Nov 2025 02:58:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ckulkarnilinux@gmail.com>) id 1vNMm7-00027k-Bs
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 02:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7A/o1KMdHnERZPkaP005IU3nW52A8GrE+BEL9651kiM=; b=RRjVMhgADqLPHkxwML5kPFJiTJ
 +MRsVtYlgstA4emVbrSgl5k+69vNZCjECD78pVBvw8k1H/BNOOJ1QD+CooTYP2qDsQS/5stwZ6ng3
 ocTH8hWeKqOfGNPgLYk3zHJK2lfG6SBfOg7gFTZ12Hm0bb3/JZ3qiQiLyoqTfjahtQ7w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7A/o1KMdHnERZPkaP005IU3nW52A8GrE+BEL9651kiM=; b=hy+HDn4X4vwlI+qVu4RKT4gfhI
 srl9egDinUQhlDHEP0pxLkKTyJyI0qyFRFlpdMR7qAGFdGsW0WyGCwRQEZ0pKTmS6QfawzmHjm3Cw
 ncNFXJmy3LCgijPlm2lN4txKZUIN2/nW13P6y9GdHMTYfv/coCWlSJuam28ZVS/R1SHw=;
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNMm7-0002fY-JM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 02:58:00 +0000
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-bd610f4425fso2279003a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 23 Nov 2025 18:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763953069; x=1764557869; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7A/o1KMdHnERZPkaP005IU3nW52A8GrE+BEL9651kiM=;
 b=DLjfsTaserxRrrFrmP+nhpmrlLDAWhLt5TAqll18nBuISoPujWmxafmfcmwbK1+o0W
 E8JV27KSImBXl0G78osCWVaBuLpObnPTeqd/TG31HDnQ5Z71FtioiPFy148oUCR/FaKq
 SyGBUN3SdO1R3uTb738TfEkyJvQxMGyTADef+3joYTD/4iFwBWzjsDEDVTIsLfaoRBsd
 QXs4u7UWvFFnwu7Bk/KGkXDOy8BVv+KC67io/tU1JC5s5VM1XWvr+OxMV5oRVMgNBZ2Q
 I+0COtw6j8EtFbOjw01VPIwB98jK9f4rGatykUJs5Cv6i/hy+2GzpJBQof2zoYvBx5+t
 zBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763953069; x=1764557869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7A/o1KMdHnERZPkaP005IU3nW52A8GrE+BEL9651kiM=;
 b=orPS0myz0f4voSJzzTF58PMedSCntvx8RKnFcvN6uEygkpAYUy4YvzQztEWX418G55
 1kQU5JCM58oXLWDzPJ5M48iK9dbXI+AZtq4R7tNSFiUvsHTVUAvTGMGGiLD5Qfc1tcYn
 9eRCTuxZoJCNr7MKbnZf9+4j5FqRxotSs9820HDM23VZLHvvg9vGuW1xeAUn+cvT6QOJ
 olAojx2AXZyG4Ues16/pVyobKT3LDPjJf5SCMAGjh6RWYeVQOTIW8xhaBJc8fajzehn+
 7k7nL5Z16O8M30mUx70FklsA9wWLghQFVhfZYhA9GmXlxJY9TBt90PcPYtet/9eI/rh6
 sKJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/kbWZDvN+f0rviUTd5cittlN5f6F2S7+iA3ExprkAdoK4VcDdBJgNh3zlAGklw9WY3587cNaCC3o5tJFLCg5D@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw99z6bCNKaSZ24NrqFRPW8N1CGNF24t5sLOiZl+C99RJxhss5G
 JnK16MOm4uHO7G7NdnrAffkI5G9P4drvSFm38J/yJVoeNih3V2orf2gM
X-Gm-Gg: ASbGncs1Di9KYkX04R7/FOLs304eT03ODArvfobqI2nlaL9IC1ZHZpn0wMyvbNB+xPn
 Yf9liTTeWgQ1YvcBc5zgx3lPTf5Vxex0HN2aP9jEkV6lU96fjib/uyDoqzKXF2jJfe9VrsH4/K9
 YGnr8KxOrqpAn8BWmXw+q2bEbCmyw8PK4u8DYr9Gevi472JZBfReavpn7wDJlb1snRlW/FYGZXa
 kusZQqnnqvRVpW2bZ6kFyngUKr/t79AnleJWfC7OlqEGWK5j1kQxgRKJAVYqPanadoRscnPB+4V
 XlJAwHkyK23m+hPrFyFaZ5qbku+i10+YeD5JGNeJOgIIRTh01sKlV5sbvz7zJhVSdjBhr71Cmkh
 3nqhjAVNTqv+iAPFg9ptVrHnmKysOTKPI3xexcDLhOkGIVZO8aPZSSbHlUQowfnXEWKvz+YM6DP
 1c1IPN2vui0k4P/jJ4cmVVAfPiYeIiDjy2dv6pSKdbFETBelQ=
X-Google-Smtp-Source: AGHT+IEmMLANDAnmsBNCneTvCZSlRusetXy+m9HCywmHN66AM/499qf8PoyOZ4xW94y10CRf7NdkQA==
X-Received: by 2002:a05:7300:538c:b0:2a4:7cb9:b7da with SMTP id
 5a478bee46e88-2a71927d85amr6563682eec.25.1763953068821; 
 Sun, 23 Nov 2025 18:57:48 -0800 (PST)
Received: from localhost (ip70-175-132-216.oc.oc.cox.net. [70.175.132.216])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2a6fc3d0bb6sm67532109eec.2.2025.11.23.18.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 18:57:48 -0800 (PST)
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
 song@kernel.org, yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, jaegeuk@kernel.org, chao@kernel.org, cem@kernel.org
Date: Sun, 23 Nov 2025 18:57:36 -0800
Message-Id: <20251124025737.203571-5-ckulkarnilinux@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
References: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  __blkdev_issue_discard() always returns 0, making the error
 assignment in __submit_discard_cmd() dead code. Initialize err to 0 and remove
 the error assignment from the __blkdev_issue_discard() call tp err. Move
 fault injection code into already present if branch where err is set to -EIO.
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [70.175.132.216 listed in dnsbl-2.uceprotect.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ckulkarnilinux(at)gmail.com]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNMm7-0002fY-JM
Subject: [f2fs-dev] [PATCH V2 4/5] f2fs: ignore discard return value
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
Cc: dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, bpf@vger.kernel.org,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

__blkdev_issue_discard() always returns 0, making the error assignment
in __submit_discard_cmd() dead code.

Initialize err to 0 and remove the error assignment from the
__blkdev_issue_discard() call tp err. Move fault injection code into
already present if branch where err is set to -EIO.

This preserves the fault injection behavior while removing dead error
handling.

Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
---
 fs/f2fs/segment.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b45eace879d7..3dbcfb9067e9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1343,15 +1343,9 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 
 		dc->di.len += len;
 
+		err = 0;
 		if (time_to_inject(sbi, FAULT_DISCARD)) {
 			err = -EIO;
-		} else {
-			err = __blkdev_issue_discard(bdev,
-					SECTOR_FROM_BLOCK(start),
-					SECTOR_FROM_BLOCK(len),
-					GFP_NOFS, &bio);
-		}
-		if (err) {
 			spin_lock_irqsave(&dc->lock, flags);
 			if (dc->state == D_PARTIAL)
 				dc->state = D_SUBMIT;
@@ -1360,6 +1354,10 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 			break;
 		}
 
+		__blkdev_issue_discard(bdev,
+				SECTOR_FROM_BLOCK(start),
+				SECTOR_FROM_BLOCK(len),
+				GFP_NOFS, &bio);
 		f2fs_bug_on(sbi, !bio);
 
 		/*
-- 
2.40.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
