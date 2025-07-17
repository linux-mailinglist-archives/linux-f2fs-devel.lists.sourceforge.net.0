Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9EFB08205
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Jul 2025 03:06:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+ZM65gIrkNUkmUFwu8jF5HhsylD3fR6nsjg9Y3IECo=; b=Pp8IJII/9l6b4gaGLTzKOGouji
	vT3ajtFHattskTbc74/QDpSowoHLqmD/7TCflIVpo5usym9s98nnKqJucmsMrwJUPMnD2E63WXsUO
	JoNJVgYVBZRW+RHU/hs85AP7Uz+uDG1x8mcL3Oet06nm+1FgkJjGltg/5wYTyV73NdD4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ucD4Y-0003DK-CW;
	Thu, 17 Jul 2025 01:06:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1ucD4X-0003DE-7W
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Jul 2025 01:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EIJgRbo2yBEeYOe56FQ8t29uLldSsA6Cw8nKiYtCDc8=; b=Jft1Nq1s6/IpzYbrMgSGrNkEfs
 92jclcdZJCjSIw+wg0psxXvgwq83/6bijgAHeSm9semS6FScwpsCy11Hm6QT4tehkHQcDaU8jJ4vN
 6nhhTlcxK9c47tGjFnf6HM9SOLGh3QTtevHJ8ghy1GuYmQYxcG2WGEq1ec4268e8Cmg8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EIJgRbo2yBEeYOe56FQ8t29uLldSsA6Cw8nKiYtCDc8=; b=gnOtq+b336VkpY2Z6jx1/6y39p
 /J1DTEQMzp4NjTNCtdfC/5C0kAJhADAYWJ9ZNKCLZ8pOrNwo59ryRWMMINUmXx+wxgWFUKRC/eeAc
 QFSybb/LbKmtUumuejaU7f1eCo4fxF57ayb+SY4ED+LJWlA5scb4cPpN3kUAp6li9Sq8=;
Received: from m16.mail.126.com ([220.197.31.6])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1ucD4V-0000k1-ER for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Jul 2025 01:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=EI
 JgRbo2yBEeYOe56FQ8t29uLldSsA6Cw8nKiYtCDc8=; b=jz6XkYHHjOmUNGKAG8
 7zHJBqjQXWUhQMLTDbg8FNOvmse7PPf0qd3RKFzMwx+JQAzX7qb7lfhMl1oceFhG
 mZ7e/kTlAWcimrvizDTPt+1IpmD3mXC2jrhIei67mlLI9wrFG/fO1X7lbE1DqhuP
 M5O7aAVyT0SiYT1bn6IUAqBD0=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wDnL_QZTHhoBW1MAQ--.5971S2; 
 Thu, 17 Jul 2025 09:04:39 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: nzzhao.sigma@gmail.com
Date: Thu, 17 Jul 2025 09:04:14 +0800
Message-ID: <20250717010414.1595-1-nzzhao@126.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <CAMLCH1HCPByhWGQjix6040fZuZhjkj19k=4pqmNzPDtGeZ0Q6A@mail.gmail.com>
References: <CAMLCH1HCPByhWGQjix6040fZuZhjkj19k=4pqmNzPDtGeZ0Q6A@mail.gmail.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDnL_QZTHhoBW1MAQ--.5971S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrykZr1DGr4rXrWxurWxJFb_yoW5XFWkpF
 W5KF1rKr4kXr4xAw47Aa12gFyF93s5JF47J34fKFWqy3W5J3sa9r1Dtas0vFWDGr93Xa1q
 vr4q934093s0vFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UpwZcUUUUU=
X-Originating-IP: [34.216.57.139]
X-CM-SenderInfo: xq22xtbr6rjloofrz/1tbiZBKNz2h4PiLMHQAAsp
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Dear Mr.Matthew and other fs developers: I'm very sorry.My
 gmail maybe be blocked for reasons I don't know.I have to change my email
 domain. > So, my proposal is that filesystems tell the page cache t [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [220.197.31.6 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1ucD4V-0000k1-ER
Subject: Re: [f2fs-dev] Compressed files & the page cache
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
Cc: jack@suse.cz, pc@manguebit.org, dhowells@redhat.com, clm@fb.com,
 linux-mtd@lists.infradead.org, linux-cifs@vger.kernel.org, richard@nod.at,
 willy@infradead.org, xiang@kernel.org, josef@toxicpanda.com,
 netfs@lists.linux.dev, dsterba@suse.com, jaegeuk@kernel.org,
 almaz.alexandrovich@paragon-software.com, nico@fluxnic.net,
 dwmw2@infradead.org, linux-f2fs-devel@lists.sourceforge.net, sfrench@samba.org,
 linux-fsdevel@vger.kernel.org, phillip@squashfs.org.uk, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Dear Mr.Matthew and other fs developers:
I'm very sorry.My gmail maybe be blocked for reasons I don't know.I have to change
my email domain.
> So, my proposal is that filesystems tell the page cache that their minimu=
m
> folio size is the compression block size.  That seems to be around 64k,
> so not an unreasonable minimum allocation size.
Excuse me,but could you please clarify the meaning of "compression block si=
ze"?
If you mean the minimum buffer window size that a filesystem requires
to perform one whole compress write/decompress read io(also we can
call it the granularity),which,in f2fs context we can interpret as the
cluster size.Then that means for compress files,we could not fallback
to 0 order folio in memory pressure case when setting folio's minmium
order to "compression block size"?

If that is the case,then when f2fs' cluster size was configured,the
minium order was determined(and may beyond 64KiB.Depending on how we
set the cluster size).If the cluster size was set to a large number,we
will encounter much more risk when in memory pressure case.

Well,as for the 64Kib minimum granularity,because Android now switchs
page size to 16Kib so for current f2fs compress implementation the
minimum possible granularity indeed just exactly equals 64Kib.But I do
hold a opinion that may not be a very good point for f2fs. Because
just as I know,there are lots of small random write on Android.So
instead of having a minimum granularity in 64Kib,I appreciate future
f2fs's compression's implementation should support smaller cluster
size for compression. As far as I know,storage engineers from vivo is
experimenting a dynamic cluster compression implementation.It can
adjust the cluster size within a file adaptively.(Maybe larger in some
part and smaller in other part)
They didn't publish the code now.But this design maybe more suitable
for cooperating with folios for its vary-order feature.

>  It means we don't attempt to track dirtiness at a sub-folio granularity
>
> (there's no point, we have to write back the entire compressed bock
> at once).
That DO has point for f2fs.Because we cannot control the order of
folio that readahead gave us if we don't set maximum order.A large folio can cross 
multi clusters in f2fs as I have mentioned.
Since f2fs has no buffered head or a concept of subpage as we have discussed previously,
It must rely on iomap_folio_state or a similar per folio struct to distinguish which
cluster range of this folio is dirty.
And it must distinguish a partialy dirted cluster to avoid compress write.
Besides,l do think larger folio can cross multi compressed extent in
btrfs too if I didn't misunderstand.May I ask how do btrfs deal with
the possible write amplification?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
