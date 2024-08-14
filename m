Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE38951452
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2024 08:15:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1se7IM-00039N-6g;
	Wed, 14 Aug 2024 06:15:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eadavis@qq.com>) id 1se7IK-00039D-Rx
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 06:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Date:Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vd36r7lQbv6nYXOkYc6WOC+IDipSdZw8rVIbaVDIHpg=; b=OPdk5odwX95ny6oNI2iNbAARqG
 Z5fza32SAZCbd+OWQgfwY69qMaA06rqxFtzGY+gKLF2Cvq7pqFN+CL4WOQqiGTzuNxmxBSpApUEaz
 RqsrSSxD62TnDIenYrWAGCEKQuirGL2wCjjJhObgu7T3YNab6W1e8D1/QBWGVinc9IE8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Date:
 Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vd36r7lQbv6nYXOkYc6WOC+IDipSdZw8rVIbaVDIHpg=; b=NIodwTjdrd/T8cAwKKGgEyAqwX
 GCzSWLI0Qjvbq49IjgRAvnnTSkOvhJdoj8/fYUXZ2CtFQ5swq+0xJSjXjrwAGZN7ugw45nn2MeTd2
 0w431D5uw5o23l8Fy0nsy3USehqoPnGJBlbD4Yn3OIAee9WsBUerKT+pIRxnaem74+4w=;
Received: from out203-205-221-173.mail.qq.com ([203.205.221.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1se7IJ-0007DG-37 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 06:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1723616126; bh=Vd36r7lQbv6nYXOkYc6WOC+IDipSdZw8rVIbaVDIHpg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=YQzcg8K15BFaQAXOgba4xMrMbTvvfM37gNhZXdVuQwbeqYNSeK4Nc37clQHgPn6WO
 85TDjN+I1EZ04OXI19jhw3QrEMnnua4aL3hQ6gQVIy04BllItt6II0Pa6pDog4pEYi
 68M2bmMZBdVBJv0tDXP2AMxhEthKtYl99mWQL6d4=
Received: from pek-lxu-l1.wrs.com ([111.198.225.4])
 by newxmesmtplogicsvrsza15-1.qq.com (NewEsmtp) with SMTP
 id 78A8E64; Wed, 14 Aug 2024 14:01:56 +0800
X-QQ-mid: xmsmtpt1723615316tx6efirj6
Message-ID: <tencent_F748BAE7BB0A33E19E051BFF4B4D1BE72508@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAjJIdlgdGWbpRtNP3ugXQhEvNeaN9QPTyTN8cb+fx+IOB34H/ROc
 zNf+xUHBe5NnK2nthP6uOo+g7aXn2ZQQ0Eb0Rey4qyGiFLanTuj530cxyXrqFqIccQj7O0GE5+qV
 eNPWckBmY3B27TBLPx1JQYxfd3r91v9sSfOpnuPpCHtoxyuKJOqLTaEZOcDSS897QumBSgTA/c2O
 w68cL38m98y3SlAEDatJRK96S0TSrcD1kjWjwlH89OKw1Lxwi1WEoyOeTlFd1nJD5QUKGoFC0qwR
 j1bh3sdgHaDFkcZZDNkYhNDNhsSOLkPp7b4AKnW/bg9OANbYHKKd8Vi8KJtI1lnh30qpfQBY2/MC
 7d1Q5yux+sifwQIf/TCUoegXVlUefRaL+ahHhz400z7QMkfJCEI9w8hw1fEQzB/UdZCqapGRL/J7
 L3GqMG8TEiJk8SRId+JHL5d6ygOQ3o1j4wlTqaSJT2tiXX1TcXC8pSIEqxB42SQz/WPUNy2C4vW6
 K3ldM4ri3LiuCy16nMBk1Jv4UVYrYmqUcuXvk5i3sCNnx+pXyn7huvG/3q8ziPQXdeER5wDKmxSp
 NbUzQigGpQ9L3nd4vu5L4qDTt2kOTadi13t6c+wnPtR/AtdMsd/tsxsOmmvDxq//qQcGsfVin/pq
 4MWqaM3VNb4ANuoTiZzdaTzcc2NINk52M/UH+zTBRKkFvLxVcS9ZMkoi4hJ7pzW7onPZpdX75RJz
 Bmu5oVWGdhUBqp/sD9TqiyyS2kbMsovbr2jL6cFFOC8ml/+4GU0pe95D1hZRI2URXlx9Z5oVJfda
 MA9e8M+oRjvmBikd/pq4+FRYEEk0hJTkxBhSbPLxxpuGK2kCGBz9k+Qs+yHoy+DqZ9Ca7HLlqjB7
 fiwoLsI7DGP2kRGA7YmOqinvvQnAIsvYOvzUKj3ChMe7Jt9/zrmJJpwS9IaXJvwU8MYT8xIiiYEN
 QxxlrupjItoRid4sZFOm6RyvzPECKVbCxEQbnxvCAGQt33exPNnoUWwsbKdjMRrkHxrELtRZkWmz
 KYYf9zVw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
To: chao@kernel.org
Date: Wed, 14 Aug 2024 14:01:57 +0800
X-OQ-MSGID: <20240814060156.827415-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <02214d48-6aee-40f7-9a40-60b4091b5bfa@kernel.org>
References: <02214d48-6aee-40f7-9a40-60b4091b5bfa@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 14 Aug 2024 11:33:32 +0800, Chao Yu wrote: > > unlock
 i_gc_rwsem[WRITE] before quiting f2fs_commit_atomic_write > > > > Fixes:
 7566a155c666 ("f2fs: atomic: fix to not allow GC to pollute atomi [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: qq.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [203.205.221.173 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [eadavis[at]qq.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.205.221.173 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.4 RDNS_DYNAMIC           Delivered to internal network by host with
 dynamic-looking rDNS
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 3.2 HELO_DYNAMIC_IPADDR    Relay HELO'd using suspicious hostname (IP
 addr 1)
X-Headers-End: 1se7IJ-0007DG-37
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING: lock held when returning
 to user space in f2fs_commit_atomic_write
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
From: Edward Adam Davis via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Edward Adam Davis <eadavis@qq.com>
Cc: eadavis@qq.com, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 jaegeuk@kernel.org, syzbot+78ff2855f26377625419@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 14 Aug 2024 11:33:32 +0800, Chao Yu wrote:
> > unlock i_gc_rwsem[WRITE] before quiting f2fs_commit_atomic_write
> >
> > Fixes: 7566a155c666 ("f2fs: atomic: fix to not allow GC to pollute atomic_file")
> 
> Since original patch has not been merged, if you don't mind, I'd like to
> fix this issue in original patch.
Okay, it's a small matter.
> 
> Thanks,
> 
> > Reported-by: syzbot+78ff2855f26377625419@syzkaller.appspotmail.com



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
