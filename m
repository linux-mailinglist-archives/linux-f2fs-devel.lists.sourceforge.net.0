Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 569B5CC606
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Oct 2019 00:45:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iGWJn-0001pY-7w; Fri, 04 Oct 2019 22:44:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iGWJl-0001pC-V3
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Oct 2019 22:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lirClf7y3JKfjQGdgMjfbQtF9VaubYMjZsQcJrWAGhg=; b=Wt91FNp81Y62uEIkQQyV3JaNx1
 iawuxMWH8r9JitlGWV86FFK8zFvBREg2usOMKLMf5Ur8+3sa6XUp5DVgazjhA35zwHdjBkNu8AtHl
 SoEJ7Y95lIsKIaJuLblGzbQSheY625Dpw4nI18iiGpCZ4HPhomXlpVop209kZPw14KG4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
 Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lirClf7y3JKfjQGdgMjfbQtF9VaubYMjZsQcJrWAGhg=; b=T
 JTLwY5PhLzpxiLyTTKaJL08ACDf8JZzrVenOuTK+Pxa+17kB/6v3e1bdKd2AdpOOhR4w/5ywEFjMl
 94P2nKb/wGNd/8sBUGA0Pz/EJtV5FEITJbD9bJd1Zg9+lDKAsxE13+0l9MU3HkhucQjY62+21YzUg
 Z6ccysh5KQKEmk9Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iGWJg-00H9LE-HL
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Oct 2019 22:44:57 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02FC420873;
 Fri,  4 Oct 2019 22:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570229082;
 bh=fit1NmJqCzqfZXbV6sDgFTYXqgc06g3fZsrCPRcI2eU=;
 h=From:To:Subject:Date:From;
 b=tmZQFylM+D2sa7scs48EbbQRZZUbI8+8276laL57QKHgF6LWMEA9EDqprSss6vAp/
 KKcTJdFQoIGo2TXY6hkZUhRc2K1TdP6XIMaq34zknkbKq4Bt2LlE7i5SNQkV1TAb5A
 QZRx+xW2AWRTo4sKa25yPMIKPD/OABzfhZnxytwY=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri,  4 Oct 2019 15:43:15 -0700
Message-Id: <20191004224317.153566-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
MIME-Version: 1.0
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
X-Headers-End: 1iGWJg-00H9LE-HL
Subject: [f2fs-dev] [PATCH 0/2] f2fs-tools: add 'copy' command to f2fs_io
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

Add a copy command to f2fs_io, to allow testing direct I/O writes where
the source page is from a different file (mmap) or an internal kernel
page (sendfile).  It could be useful for other tests in the future too.

Eric Biggers (2):
  f2fs_io: add helper functions for handling errors
  f2fs_io: add copy command

 tools/f2fs_io/f2fs_io.c | 363 +++++++++++++++++++++++++---------------
 1 file changed, 229 insertions(+), 134 deletions(-)

-- 
2.23.0.581.g78d2f28ef7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
