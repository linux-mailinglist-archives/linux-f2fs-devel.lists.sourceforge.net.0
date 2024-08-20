Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 885FD957B14
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2024 03:41:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgDsR-0005Hk-Ji;
	Tue, 20 Aug 2024 01:41:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sgDsQ-0005He-JN
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 01:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nJ8lRfW8u3zgdNMAqR17ZexppNbYEpAe+OpO0AETvpE=; b=IldOB3nQvworSzrAslKs6oI+J4
 /0xqEi26GfMDBkGN9S3lmTpmGDfqu9mMlvOoAr2nxPIxmh3Xd7GSyCBvN170GBk0ljwb6SemsHUYi
 l2mhd6lHr/ptzgVfVhXHGwPMsHb9T8ZQlrThvOoG07efEmmVQ9Ha9lWjCam8nyZQAAzg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nJ8lRfW8u3zgdNMAqR17ZexppNbYEpAe+OpO0AETvpE=; b=bhRqoc6+IIl1fmUMoxzzn6fKiD
 3fcxGncpWhsC8onRxTCFVPMwQIwPzZ9+gGv9dQzBJmeCGnM2Gzj++WqaynYODygOcFTmUjNC06H1J
 zzUTflvq8yNjDfsG9ZjWmbvMfdJLKgWAiqct2REiG3dzUGFWpLbKwucVg6pyVPCZcats=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgDsP-0007mN-Od for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 01:41:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 920C2CE0AD0;
 Tue, 20 Aug 2024 01:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC73C32782;
 Tue, 20 Aug 2024 01:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724118089;
 bh=DCkLKogFb/upcpjYJqPenpeaoza5XAjOBnH2HCDseas=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=PYFib4cAHxbYSqhpOSWIvsGGsEwGMVLadyYN6XW1hisORKzZgr0N+YEbA78XZtA2/
 oKvMmxTFvS3vU3lsYWbLeNKdiiGSLqnmvIjWBF5+QHtQLdgHEJj7f4LBOyxdwx3VYo
 EhnB3N9/6AdD3nh2IH1h7lIBv0nvNZQ5v/ZJE1+nAtka3Mcd1nNCU/7Zb+vwYjC9fy
 4z+Pb7leNCwLyjRpWB1nwEgnLUYZh9b4+B0JfOGMLE2JulxSNWaVs9myjIIJ2zOS37
 4lWp/qqsMXLHkpQFhA9zbSZQsj9/wtLvWwkHUXqOZfK0VOUwgsz+jfpzrpmkaLgpTb
 vqGGdDXgvDj4Q==
Message-ID: <315d5849-69ea-4574-8157-22d34c2ca0b6@kernel.org>
Date: Tue, 20 Aug 2024 09:41:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+f195123a45ad487ca66c@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <00000000000038c729061ef13d67@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <00000000000038c729061ef13d67@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz fix: f2fs: fix return value of
 f2fs_convert_inline_inode()
 On 2024/8/5 23:22, syzbot wrote: > syzbot suspects this issue was fixed by
 commit: > > commit a8eb3de28e7a365690c61161e7a07a4fc7c60bbf > Author: Chao
 Yu <chao@kernel.org> > Date: Mon Jun 3 01:07:45 20 [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: goo.gl]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sgDsP-0007mN-Od
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_vm_page_mkwrite
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

#syz fix: f2fs: fix return value of f2fs_convert_inline_inode()

On 2024/8/5 23:22, syzbot wrote:
> syzbot suspects this issue was fixed by commit:
> 
> commit a8eb3de28e7a365690c61161e7a07a4fc7c60bbf
> Author: Chao Yu <chao@kernel.org>
> Date:   Mon Jun 3 01:07:45 2024 +0000
> 
>      f2fs: fix return value of f2fs_convert_inline_inode()
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1055414b980000
> start commit:   83814698cf48 Merge tag 'powerpc-6.10-2' of git://git.kerne..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=238430243a58f702
> dashboard link: https://syzkaller.appspot.com/bug?extid=f195123a45ad487ca66c
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1129d362980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10d4ce06980000
> 
> If the result looks correct, please mark the issue as fixed by replying with:
> 
> #syz fix: f2fs: fix return value of f2fs_convert_inline_inode()
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
