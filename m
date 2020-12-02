Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 548BD2CC579
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Dec 2020 19:43:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Date:Message-ID:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JLLZgtl+TzjRpzLr7pk2jgM3im+kPAx77McSJ3GH+pg=; b=bs1VThQg9mClRSfD98jA3pLhmp
	3osjqous3WivNEsxwthHs0lPfPUodrUTq2Y2gr4AUmxrr4ekDCeUXK7JcIKFkM0o80Zw8T2VtvkuQ
	36/PNjS0j9n1jmpCjxBTRWQ+OAVz6Ec9eNSLWmvi7SC7YlQQ1qR239o1MLwxLn6BUWr8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkX5z-0005GH-Nk; Wed, 02 Dec 2020 18:43:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <m.novosyolov@rosalinux.ru>) id 1kkX5x-0005G6-TG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 18:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:Subject:To:From:Cc:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PIwAsHZW/hwl7UejzK9OpkUsDRPclvc5o6E6ZBoF/I4=; b=SDbnk9XjVQep8dsAcAeMpmvyu6
 alZOsQS9kLGiaclenAgGQ6CQMLu/YWFQZ5UV0n2XAYoo4yXswFGCrjsuTjZ//ezwTfr55e9r5jizJ
 j4ayNwiHid+Z99kD8n6xm5YgAGs+UwtGQlAooydz4gzUE80qIvlw0ifZ6ojsPUOAmaWU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:
 Subject:To:From:Cc:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PIwAsHZW/hwl7UejzK9OpkUsDRPclvc5o6E6ZBoF/I4=; b=E
 SJ2DyREAz4FztDQpRrRa0KFil7Y7Rs+48ctOSjTmzxUuSd9cxXah3XIK/L05yc9EQoSwzjGR2ZpKb
 7pUua0tUMf2PxbBjcQ5Y2VXfqWnQQoj7l9mQKQ3cD4iO1AtSG1SnAVfFdI5mCp5Tz8dJ0dBRMJAb+
 HQHSSIXl7SB7lkTQ=;
Received: from mail.rosalinux.ru ([195.19.76.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkX5s-00Buey-8L
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 18:43:17 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 379AFE1E872EA;
 Wed,  2 Dec 2020 21:24:21 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id OeNrbNBQ2iTT; Wed,  2 Dec 2020 21:24:20 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 953A5E1E872EC;
 Wed,  2 Dec 2020 21:24:20 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 953A5E1E872EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1606933460;
 bh=PIwAsHZW/hwl7UejzK9OpkUsDRPclvc5o6E6ZBoF/I4=;
 h=From:To:Message-ID:Date:MIME-Version;
 b=c8NUjV/ioJBvclIXMHRwMdC5vSChf2S+aZRnQEy8qxHauGlnRGhcN6zN5RsH3FSHV
 UDmtJw4UNwxuQ1Y8gzkaleZgG9EJO6oNDLqdQHYzzMM4Qzmr58oFyVccvH/WfQ9Qb4
 qVnrpAEbjwzC6EUCesmYSkb9+gfEThLQP2fUfEp6EcEzZa4p5hNnbVpaeihwDRXSuw
 DgGZI+81G8hdFm32uSOqqPD6Y+Sibo9U8w1qL/nbhT/c1W5jN1/WMyz6Y57MZlUpRB
 FucMmME85L4JJtqaWT5T6m5aGRTSZ0Z+2cHOofLsy0RsgpQxBlwcETKxu3eK/h/KuD
 CEGt6e4f5wasQ==
X-Virus-Scanned: amavisd-new at rosalinux.ru
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id VgTYplnFDiEE; Wed,  2 Dec 2020 21:24:20 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-71-204.ip.moscow.rt.ru
 [90.154.71.204])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 32104E1E872EA;
 Wed,  2 Dec 2020 21:24:19 +0300 (MSK)
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <6ab5fbf4-5c78-8edc-14f0-f280a330d23d@rosalinux.ru>
Date: Wed, 2 Dec 2020 21:24:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Language: ru-RU
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
X-Headers-End: 1kkX5s-00Buey-8L
Subject: [f2fs-dev] Using secure erase in f2fs
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
From: Mikhail Novosyolov via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Cc: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>,
 Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello, f2fs developers!

I saw commit 9af846486d781a63 "f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl" in Linux kernel
https://github.com/torvalds/linux/commit/9af846486d781a63de025a5f502c515268e48790#

I saw usage of it in Android only
https://android.googlesource.com/platform/system/vold/+/master/secdiscard.cpp

Do I understand correctly that userspace code decides himself where the region to erase starts and when to call that ioctl?

I am interested in it to implement realtime secure erase - overwriting files with zeros or random data (I am not interestied in sending a discard/trim command) - when files are deleted or are removed completely.
This code seems to be a good solution of this problem, but the problem is that kernel cannot trigger it by itself.

I think it should be possible to call this from another part of f2fs when a file is being edited or unlinked, but I am not sure from where exactly.

F2FS has background housekeeping, it would be nice if it could issue secure trim in the background.

Also, I am not sure that it will work with symlinks correctly, for example.

Please give a direction.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
