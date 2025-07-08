Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5028CAFC3EC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 09:23:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Date:To:From:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMBTiKZBMAz4cpg1HTiwTLMRILHmhXHqFB3Hm0xqLsA=; b=h0coJhyu03Cg/+I93CYYIHTSdw
	wAjHWs+Wzms5/9qOOh9pEFzdZBtGVSmPWURqxKm4/7f6es2q1gAMI+nUWcwDJYmwrM7cRSKYBcb/b
	akw/8lQBLWDoNtRH22a1foVOfgVuhNMGx/zVBeQz5oRB1m7cucXcZD4u5jvuiyqBPWK0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZ2fm-0001eI-Lf;
	Tue, 08 Jul 2025 07:23:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ywen.chen@foxmail.com>) id 1uZ2fl-0001e9-4a
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 07:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Date:Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rgW1EbDqX+O9wPlMcm457ujwjBjyq0KCUjbW0ywG0Dg=; b=ia1KgUyRk37t8778ZH/j2HM+xX
 kT2yaGlhKQrIMpW5r3BWciMYV0jJK0V1WE9FWezCl3DeZFGqhkOoTorhkqo9Itny3c7k+5ejzA3Zb
 S9fKHg9udIyKndFS8ezCtILGzfgAQCRyPWgdNhW9ll3dBXmlCPMJMj3q3F9rrGOuQl5s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Date:
 Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rgW1EbDqX+O9wPlMcm457ujwjBjyq0KCUjbW0ywG0Dg=; b=g3FDFxhTVp67zNQ85pPhlVbCcz
 2iHO+l/Q3DaDelYx7i2iwyL1UzZ7oYGBSkeLvbc9lGK2eBAIAwB3kLaSz+ln7xF4a2fovHXW975qL
 wZZJCpCAXIV9M5nCTG+iqA0FOP0T4+MQYcyt+AR28csrSlcuW5orRQmXrR90A8GMNmyM=;
Received: from out203-205-221-239.mail.qq.com ([203.205.221.239])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZ2fk-0000qY-CA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 07:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1751959087;
 bh=rgW1EbDqX+O9wPlMcm457ujwjBjyq0KCUjbW0ywG0Dg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=bThCIpkG4FIwUktEc4L6qGGP1yhuxw7/ukKb5Jz8V8qz+0LCdLFQ+b8SsW00cLG0E
 OuOS+MWh2FSj1MekEfO+spEA0B2BXLCPBkqmpZg01pCPqypt3Mq8DD2PUn0Q0NACxI
 IF/XiSiACm9opoogQJjCQEue/YoJz7GyHOBsAhuM=
Received: from meizu-Precision-3660.meizu.com ([112.91.84.73])
 by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
 id 2E92B483; Tue, 08 Jul 2025 15:11:41 +0800
X-QQ-mid: xmsmtpt1751958701tlp273eg5
Message-ID: <tencent_19ABF292BF48BBA08B98B8C3C7BD5D19CE09@qq.com>
X-QQ-XMAILINFO: NDgMZBR9sMmawRpms6Ue/39BQQ1SRHowQpkx27lg4qRnEyrDKufpEe6JoiwE0s
 X4bUjYFCuqPdCbfYYIFhf9vrdN+PzxNOI/ByibxMc60LKkq1AUMsXP/6AcJrxdtQqAq5Q0a0IJkx
 NaTDDt2HEJ8CiHe9EOdkaQg5CO1oeqX3d919iGGttuQi7kXVNaq9YNMNQ8QXTsnTq7WOsCx3sF/Y
 2iqJm8SS8Hw7wbvdprC6vq2zA/oLeCyS0WpPYfjqEHYSRnrARSXp4ou+eQ+RdvvXG7BuYMHpA/d/
 vOYjXICj+D7IVgOL2xnAhpj4gc+zyJPFU8DK7Y4ULYekU378T+x9eye4cRdZrdZ8R86F4PC0Yxf0
 GUHK845Y8M/BURpKI/ERfIIxgcHgmceJwZSGud2LahiyT+1kKHg4Lixl0QTrxsZYYssTUi+1olqt
 TFm1jgsn0Kq+08J3hM1y2wIYvC0KGnmxG+fbtZ8bbmKCNATl4haAHgSQO8gpVNZnyBCe18tCQqW4
 AQf1teH5Q+FQ5osKuP4hCzjXCFSXNcnv+VUcQMZMwryTkz9N7dq3vb4cguh3Kf8L0WVzuuay3BTL
 5M/oIIOhYTSwSg2nOISpNaW04R+vvzqb+Ht59wY01WZdkI4uOjdLYcTc61uNs5j+gvURqYiwdFpU
 /gip+yblaxFsKwc1I6S9xMpA9YDONR0wB9yAFCFSh1IjwqRALZHRgp/67oasvkvNY8PzV6ilcdwO
 idNafDhJ2l94tg95QKmw0SSpxxWfeAZmXyEbhepumU3g6W+POnW59tFGNo2fkyMHwWaA9PVedHsq
 ZDO3wxqRQA+Mfb29a3P8Qjx35mO1lMoXbvFcBrTblRVvDdWgKxRL36jD+zJFx4jmD0PP9+hJvspG
 U+0K2myUpjwLv6S8iJrwTgWC2l+sW6WIhM4U5ihg4jY4U6VfB9UAURSuVgZxOXgSZ0VZYncVzH8b
 wcAj7s5h0lyB4CG3vj/gVRCxQHgaDqtXJYBN9aF1cN0+6fngS+YeK9VhrVR//z5HlizyVog2WO80
 fJOz+hfQ==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Yuwen Chen <ywen.chen@foxmail.com>
To: hch@infradead.org
Date: Tue,  8 Jul 2025 15:11:41 +0800
X-OQ-MSGID: <20250708071141.847557-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aGtatW8g2fV6bFkm@infradead.org>
References: <aGtatW8g2fV6bFkm@infradead.org>
MIME-Version: 1.0
X-Spam-Score: 3.4 (+++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, 6 Jul 2025 22:27:17 -0700 Christoph Hellwig wrote:
 > But I wonder why generic_ci_match is even called that often. Both ext4
 > and f2fs support hashed lookups, so you should usually only see it [...]
 Content analysis details:   (3.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ywen.chen(at)foxmail.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.205.221.239 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.4 RDNS_DYNAMIC           Delivered to internal network by host with
 dynamic-looking rDNS
 3.2 HELO_DYNAMIC_IPADDR    Relay HELO'd using suspicious hostname (IP addr
 1)
X-Headers-End: 1uZ2fk-0000qY-CA
Subject: Re: [f2fs-dev] [PATCH v3 1/2] libfs: reduce the number of memory
 allocations in generic_ci_match
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
Cc: brauner@kernel.org, ywen.chen@foxmail.com, tytso@mit.edu,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, 6 Jul 2025 22:27:17 -0700 Christoph Hellwig wrote:
> But I wonder why generic_ci_match is even called that often.  Both ext4
> and f2fs support hashed lookups, so you should usually only see it called
> for the main match, plus the occasional hash false positive, which should
> be rate if the hash works.

At present, in the latest version of Linux, in some scenarios,
f2fs still uses linear search.

The logic of linear search was introduced by Commit 91b587ba79e1
(f2fs: Introduce linear search for dentries). Commit 91b587ba79e1
was designed to solve the problem of inconsistent hashes before
and after the rollback of Commit 5c26d2f1d3f5
("unicode: Don't special case ignorable code points"),
which led to files being inaccessible.

In order to reduce the impact of linear search, in relatively new
versions, the logic of turning off linear search has also been
introduced. However, the triggering conditions for this
turn - off logic on f2fs are rather strict:

1. Use the latest version of the fsck.f2fs tool to correct
the file system.
2. Use a relatively new version of the kernel. (For example,
linear search cannot be turned off in v6.6)

The performance gain of this commit is very obvious in scenarios
where linear search is not turned off. In scenarios where linear
search is turned off, no performance problems will be introduced
either.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
