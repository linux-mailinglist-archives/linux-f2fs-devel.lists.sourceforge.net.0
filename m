Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFF8C362D4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 05 Nov 2025 15:54:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InDE4beOaDxT/mEHe7Ha0gv2i9hwgxrMuSUBTX7dv0k=; b=Z3+XlLHeuEPEmy8KA8tZrIOz80
	hQZzHH/AZZnof/ghyc5KH7XIynoTCzOBSlhASMmUjIhwwzVK4we+Se6JGuC8an5e7+S7ZE5B81sQW
	h4VEGF9u3tucgf4dXl/pVhTTosb2qGogbPnhJN9T1OfQ+taHKk4qVd+SVdYHXdLoj6vw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGeuN-0005et-G6;
	Wed, 05 Nov 2025 14:54:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1vGeuH-0005ei-Lm
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 14:54:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4WxYZ+JeksWx9qzLRbdr/qx4v36wWsQth6BFNnfgxlQ=; b=dzsS1N6WjEfPNddysgCPBc5P0h
 5tHL+FHbxSYNtLsSiNvqQAM69t4OFLIgiC2Rfrp2F4DRVNZNQ98xmxIz/yZ0nqXfTYx9iY0xbv1BC
 8FKZAGCBwfwKdE/6hWhQwJ7rMd0Gm2g8oq3yJ2/j8f3r7A3PEHqX1gI7SHYvdDsAFpCc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4WxYZ+JeksWx9qzLRbdr/qx4v36wWsQth6BFNnfgxlQ=; b=CMnLv+6stbXW65AN/HeWikW+Tx
 mwdjWr0VU5NKTetXu/fsMR+6jrX/NcF+fSNQf0mfYSMVuToA53txifTdWgn965K7VzyY09eHRvMi/
 l7Ejwn89mYJ1C5InJdKCEWplK9v3R6VMvG1enEQycvtpQR7HZgia452hShcxxoQcf6as=;
Received: from [193.142.43.55] (helo=galois.linutronix.de)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vGeuH-0005SO-Dg for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 14:54:42 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1762354469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4WxYZ+JeksWx9qzLRbdr/qx4v36wWsQth6BFNnfgxlQ=;
 b=ixdPaQRVOB+Vf/Rjjt9TIHFHfrqbSTg3oXt1SBrY/0vcLZ3MY87d7ex88vzn9l3lEIuIr4
 SYOhn1zLfUUR9JxPwjeVT3ocT2rGfFH9s0+WhzF8+55J3QdyYj0GGo9OxBGtgCLzc3cEB4
 j+7huapGfATu6aXcGZx3HvIVIRJd2rx361EYoZ4iWJww4qISDNV+YhQMhfuIfwD9zpD4EU
 0vfvDqS4xB2aOQCu29sG8SGr4nzHqkpKmfxGlwBIaWjcQXMCYgdpWNJH4BD4eRd+S5GU80
 LcUK6NbiRXQLTibQHLucRQq7kjLOW/8GAhso1ChYyGhbENo+5sYW9hDGQAAu6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1762354469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4WxYZ+JeksWx9qzLRbdr/qx4v36wWsQth6BFNnfgxlQ=;
 b=2m96Jera/0TPmblmwvx8TPXahXVuSgKJFttdj9F8sJkbbeCoeN5f4LoITxROKlrWQVRSFQ
 9nPJhdCcdzIbFODw==
To: Petr Mladek <pmladek@suse.com>, Joanne Koong <joannelkoong@gmail.com>
In-Reply-To: <aQpFLJM96uRpO4S-@pathway.suse.cz>
References: <CAJnrk1bF8sLU6tG2MGkt_KR4BoTd_k01CMVZJ9js2-eyh80tbw@mail.gmail.com>
 <69096836.a70a0220.88fb8.0006.GAE@google.com>
 <CAJnrk1Yo4dRVSaPCaAGkHc+in03KaTXJ+KxckhLoSrRxbEdDBg@mail.gmail.com>
 <aQpFLJM96uRpO4S-@pathway.suse.cz>
Date: Wed, 05 Nov 2025 16:00:28 +0106
Message-ID: <87ldkk34yj.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 1.7 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-11-04, Petr Mladek <pmladek@suse.com> wrote: > Adding
 John into Cc. Thanks. > It rather looks like an internal bug in the
 printk_ringbuffer
 code. > And there is only one recent patch: > >
 https://patch.msgid.link/20250905144152.9137-2-d-tatianin@yandex-team.ru
 > > The scenari [...] 
 Content analysis details:   (1.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1vGeuH-0005SO-Dg
Subject: Re: [f2fs-dev] [syzbot] [iomap?] kernel BUG in folio_end_read (2)
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
Cc: brauner@kernel.org, djwong@kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 syzbot <syzbot+3686758660f980b402dc@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org,
 "amurray@thegoodpenguin.co.uk" <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025-11-04, Petr Mladek <pmladek@suse.com> wrote:
> Adding John into Cc.

Thanks.

> It rather looks like an internal bug in the printk_ringbuffer code.
> And there is only one recent patch:
>
>    https://patch.msgid.link/20250905144152.9137-2-d-tatianin@yandex-team.ru
>
> The scenario leading to the WARN() is not obvious to me. But the patch
> touched this code path. So it is a likely culprit. I have to think
> more about it.

I have been digging into this all day and I can find no explanation.

The patch you refer to brings a minor semantic change: is_blk_wrapped()
returns false if begin_lpos and next_lpos are the same, whereas before
we would have true. However, these values are not allowed to be the same
(except for the data-less special case values).

> Anyway, I wonder if the WARNING is reproducible and if it happens even after
> reverting the commit 67e1b0052f6bb82be84e3 ("printk_ringbuffer: don't
> needlessly wrap data blocks around")

Note that a quick search on lore shows another similar report:

https://lore.kernel.org/all/69078fb6.050a0220.29fc44.0029.GAE@google.com/

We may want to revert the commit until we can take a closer look at
this.

I will divert my energies from code-reading to trying to reproduce this.

John


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
