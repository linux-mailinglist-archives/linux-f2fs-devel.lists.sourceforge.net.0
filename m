Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BECEC36CAA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 05 Nov 2025 17:49:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HT8N7v+38nVDaSWBl5eKEFAMFSch9fywMnmu86Px10s=; b=WhM8XoccYwjaQ4j9AsPnE687UX
	1T2Qrp8A2zC1fJBLLaTIiYnc/XffuE7xbeLNF5PFm56m7aiwnI5yzhKiY00fr4XvXuo0bKAaeJiMn
	uNXLIfuFSbAWcVGMOmtf8iyvYNcacv9pQQRGQlIj4zcguVhCYWWTQV8xMTzW82ChcOoE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGghP-0005vY-Ll;
	Wed, 05 Nov 2025 16:49:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vGghH-0005vJ-EI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 16:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VzAdXoC6s7lAPFTJ0zwUPD4vM8vI+YgP+K4s+TQh7Uo=; b=JF27VYEejshg5DeA4Yo87SMpuo
 kGmwuKZhPBYYDcHhKtDVWZIbGLaEcFBBoh2SMgZPWqvrWHJNC4Rt6hzUkxcHsBWKva8rKs/DPRF/K
 5ZqUexxkUrd85KuL28LSC1z3JjiZr7FemHhUuuKDDMqE9Ab2gIkoqcyuXSljs1yGzGWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VzAdXoC6s7lAPFTJ0zwUPD4vM8vI+YgP+K4s+TQh7Uo=; b=PVuwguquZSCygQFUNpwpXzPkKF
 8M/he3h5arKOkQaV/iZqpWdVt0EYQfA1IgTqeMuiNXYynOwf5sNUug1lRfQaHVl1m9r7DMMC262lR
 7tuLB2P6+BgJ4p6RQWGLOisLwMCaG6WUu7b8HIRz7nPEBpJTs14YCXBuYILVAaDaF8SQ=;
Received: from mail-ej1-f45.google.com ([209.85.218.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vGghG-0008Kx-DR for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 16:49:23 +0000
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b64cdbb949cso2617566b.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Nov 2025 08:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762361351; x=1762966151; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VzAdXoC6s7lAPFTJ0zwUPD4vM8vI+YgP+K4s+TQh7Uo=;
 b=P4YUgc0Xg1GgqCkEq0765Q5QdgSJl7Uo3PnM0G8sj7Z5ThYs3urt/a3I7b4GfJVJj0
 AjxvXip3w9KUlqrvQWDOrCXYSpa913JjvrWyPESjGA3O+nbyu90efB+sPzhu3+yH7Aip
 /k9ibaMiEnYb/nfzm2sKXjrdNgseDOKizsD/EUPe0NGzcPA0CiU4A78ReTm84RcxHCal
 jwShiHTueHWN9YEmNDLAmHP4uthmFWDXWXRhyChs9jvb09y741zdtqBF3zS1isN/8nq7
 qwayfYb1kRBpZfvwGtysEaQIUSh3+X5kmfC20FeUs/T1v4tHdl5nNHzkpeYOpQHgMgGi
 xkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762361351; x=1762966151;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VzAdXoC6s7lAPFTJ0zwUPD4vM8vI+YgP+K4s+TQh7Uo=;
 b=eeXQz8cewTo0eMP2ZSAcSg6IedA3f98a5pjpsvCyEhxJOu1ZIqXCGnbJhVXzGH1Ph1
 EE7eDWvCbYV6/RmCcfAdV9V0JCdcDG4+G9QMimf1itJMU0Q04bC594f3gShGvRMqx96W
 AcW0oz5G3ZFoF4w/64AnCrLYsJzd3jsiO98sIKNdE47+54ASWDLEuKpOJxCpPv4UeyZ5
 gvqLxxc3pAPrDwWvP2X4TDCCzE4rc0BvAVnZJWHtr08kg56HzIwQ1OQ8+MJqILZiL/yi
 H2rocMggLVuEr+KWHMMKpqMJ3qGIo5gRuifBCdDQmOgduHISyMWrpFyDd18kTpyBJOZ0
 4RRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXfHTcz7myLUrRFU57KayBSmSF5sy72UhuiVXg5w6O/P8oqvnGlY7GBL2PrmqB1Haqk1HKxdPnpP2wY8VvqH/V@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzzfpC9m8uNx81UWL8GlVEdpAv7ei7Pxz1Q1rHlDg/8gYlySodG
 CzYHbWtVSHXl8LQu27tSKkYurhPj5KbOrVxjPJKHJLpcMVobrlFbOEgHGHl7m5MQ1fM=
X-Gm-Gg: ASbGnctfGV647yZfd87qiteLPjRhlL4uNqDDvNjznZyP2UFFcf2QppA9eyu7Aq7Hht3
 fyImm/BE9ark9Vch5wVM9LrWCFGk58FL4G5oK4hidG9OpREKLbGP1OddcpWEQUp7XXpTcF+pCRy
 g/NJ74XXVwPBDyKfcap2jJuJgR7ts/HawpSs65ZNzVEBMejIL6UusYk/TVh0ULTRuoo5Jbbs6ju
 sr/aEHSwEM3j0NcVTqzenkJAT9RMaFNZZ+4KyL+cTrqF+0BEIU0LcxZt2D850/xmSbZnLnohO3F
 jSC8FAsqVWAzHk+KxqZMVZqtioEpF2y8NYSZpgMTdoYzIgI1ueNVKfBQvhR1pLATjLS8JCN+7GF
 A6NiY3iukUvQxZgCw7Dug5ywsyHAyFbxBCr3JmQTk3N+7IqPOncfIjbruih0CEanb+ccMRk7rbL
 svFD4=
X-Google-Smtp-Source: AGHT+IGHUT5RniJcu8k42vGSvXXlGC0LkCHKON0glXSnAdByNfQbUjryvTXs5YwTdZkkYEVYpMM18A==
X-Received: by 2002:a17:907:1c0a:b0:b28:b057:3958 with SMTP id
 a640c23a62f3a-b726554c3d8mr437513666b.48.1762361350790; 
 Wed, 05 Nov 2025 08:49:10 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72896c7991sm1061366b.71.2025.11.05.08.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 08:49:10 -0800 (PST)
Date: Wed, 5 Nov 2025 17:49:08 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <aQuABK25fdBVTGZc@pathway.suse.cz>
References: <CAJnrk1bF8sLU6tG2MGkt_KR4BoTd_k01CMVZJ9js2-eyh80tbw@mail.gmail.com>
 <69096836.a70a0220.88fb8.0006.GAE@google.com>
 <CAJnrk1Yo4dRVSaPCaAGkHc+in03KaTXJ+KxckhLoSrRxbEdDBg@mail.gmail.com>
 <aQpFLJM96uRpO4S-@pathway.suse.cz>
 <87ldkk34yj.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ldkk34yj.fsf@jogness.linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 2025-11-05 16:00:28,
 John Ogness wrote: > On 2025-11-04, 
 Petr Mladek <pmladek@suse.com> wrote: > > Adding John into Cc. > > Thanks.
 > > > It rather looks like an internal bug in the printk_ring [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.45 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vGghG-0008Kx-DR
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
From: Petr Mladek via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: brauner@kernel.org, djwong@kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 syzbot <syzbot+3686758660f980b402dc@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, Joanne Koong <joannelkoong@gmail.com>,
 "amurray@thegoodpenguin.co.uk" <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 2025-11-05 16:00:28, John Ogness wrote:
> On 2025-11-04, Petr Mladek <pmladek@suse.com> wrote:
> > Adding John into Cc.
> 
> Thanks.
> 
> > It rather looks like an internal bug in the printk_ringbuffer code.
> > And there is only one recent patch:
> >
> >    https://patch.msgid.link/20250905144152.9137-2-d-tatianin@yandex-team.ru
> >
> > The scenario leading to the WARN() is not obvious to me. But the patch
> > touched this code path. So it is a likely culprit. I have to think
> > more about it.
> 
> I have been digging into this all day and I can find no explanation.
> 
> The patch you refer to brings a minor semantic change: is_blk_wrapped()
> returns false if begin_lpos and next_lpos are the same, whereas before
> we would have true. However, these values are not allowed to be the same
> (except for the data-less special case values).
> 
> > Anyway, I wonder if the WARNING is reproducible and if it happens even after
> > reverting the commit 67e1b0052f6bb82be84e3 ("printk_ringbuffer: don't
> > needlessly wrap data blocks around")
> 
> Note that a quick search on lore shows another similar report:
> 
> https://lore.kernel.org/all/69078fb6.050a0220.29fc44.0029.GAE@google.com/

Great catch!

There is a common pattern. There is always one dropped message before
the WARNING() triggers.

This is from
https://syzkaller.appspot.com/x/log.txt?x=1653a342580000

[  179.188108][ T7136] ntfs3(loop0): Different NTFS sector size (4096) and media sector size (512).
** 1 printk messages dropped **
[  179.211874][ T7136] ------------[ cut here ]------------
[  179.211911][ T7136] WARNING: kernel/printk/printk_ringbuffer.c:1278 at get_data+0x48a/0x840, CPU#1: syz.0.359/7136


And this is from
https://syzkaller.appspot.com/x/log.txt?x=1370a292580000

[  216.317316][ T7652] loop0: detected capacity change from 0 to 16
** 1 printk messages dropped **
[  216.327750][ T7652] ------------[ cut here ]------------
[  216.327789][ T7652] WARNING: kernel/printk/printk_ringbuffer.c:1278 at get_data+0x48a/0x840, CPU#1: syz.0.585/7652


I wonder whether it is related to blk_lpos->begin or blk_lpos->next
overflow. They are supposed to overflow at the end of the 1st wrap,
see kernel/printk/printk_ringbuffer.h:

<paste>
 *   BLK0_LPOS
 *     The initial @head_lpos and @tail_lpos for data rings. It is at index
 *     0 and the lpos value is such that it will overflow on the first wrap.
[...]
*/
#define BLK0_LPOS(sz_bits)	(-(_DATA_SIZE(sz_bits)))
</paste>


Now, the question is why the following check ends by the WARN():

static const char *get_data(struct prb_data_ring *data_ring,
			    struct prb_data_blk_lpos *blk_lpos,
			    unsigned int *data_size)
{
[...]
	/* Regular data block: @begin less than @next and in same wrap. */
	if (!is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next) &&
	    blk_lpos->begin < blk_lpos->next) {
		db = to_block(data_ring, blk_lpos->begin);
		*data_size = blk_lpos->next - blk_lpos->begin;

	/* Wrapping data block: @begin is one wrap behind @next. */
	} else if (!is_blk_wrapped(data_ring,
				   blk_lpos->begin + DATA_SIZE(data_ring),
				   blk_lpos->next)) {
		db = to_block(data_ring, 0);
		*data_size = DATA_INDEX(data_ring, blk_lpos->next);

	/* Illegal block description. */
	} else {
		WARN_ON_ONCE(1);
		return NULL;
	}
[...]

The new is_blk_wrapped() check makes sense on its own.

But what happens when blk_lpos->next overflows to "0"?
is_blk_wrapped() returns false because it checks (blk_lpos->next - 1).
But the extra check "blk_lpos->begin < blk_lpos->next" fails because
it checks the overflown "blk_lpos->next".

I guess that we should do:

From f9cae42b4a910127fb7694aebe2e46247dbb0fcb Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.com>
Date: Wed, 5 Nov 2025 17:14:57 +0100
Subject: [PATCH] printk_ringbuffer: Fix check of valid data size when blk_lpos
 overflows

The commit 67e1b0052f6bb8 ("printk_ringbuffer: don't needlessly wrap
data blocks around") allows to use the last 4 bytes of the ring buffer.

But the check for the data_size was not properly updated. It fails
when blk_lpos->next overflows to "0". In this case:

  + is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next)
    returns false because it checks "blk_lpos->next - 1"

  + but "blk_lpos->begin < blk_lpos->next" fails because
    blk_lpos->next is already 0.

  + is_blk_wrapped(data_ring, blk_lpos->begin + DATA_SIZE(data_ring),
    blk_lpos->next) returns false because "begin_lpos" is from
    next wrap but "next_lpos - 1" is from the previous one

As a result, get_data() triggers the WARN_ON_ONCE() for "Illegal
block description", for example:

[  216.317316][ T7652] loop0: detected capacity change from 0 to 16
** 1 printk messages dropped **
[  216.327750][ T7652] ------------[ cut here ]------------
[  216.327789][ T7652] WARNING: kernel/printk/printk_ringbuffer.c:1278 at get_data+0x48a/0x840, CPU#1: syz.0.585/7652
[  216.327848][ T7652] Modules linked in:
[  216.327907][ T7652] CPU: 1 UID: 0 PID: 7652 Comm: syz.0.585 Not tainted syzkaller #0 PREEMPT(full)
[  216.327933][ T7652] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
[  216.327953][ T7652] RIP: 0010:get_data+0x48a/0x840
[  216.327986][ T7652] Code: 83 c4 f8 48 b8 00 00 00 00 00 fc ff df 41 0f b6 04 07 84 c0 0f 85 ee 01 00 00 44 89 65 00 49 83 c5 08 eb 13 e8 a7 19 1f 00 90 <0f> 0b 90 eb 05 e8 9c 19 1f 00 45 31 ed 4c 89 e8 48 83 c4 28 5b 41
[  216.328007][ T7652] RSP: 0018:ffffc900035170e0 EFLAGS: 00010293
[  216.328029][ T7652] RAX: ffffffff81a1eee9 RBX: 00003fffffffffff RCX: ffff888033255b80
[  216.328048][ T7652] RDX: 0000000000000000 RSI: 00003fffffffffff RDI: 0000000000000000
[  216.328063][ T7652] RBP: 0000000000000012 R08: 0000000000000e55 R09: 000000325e213cc7
[  216.328079][ T7652] R10: 000000325e213cc7 R11: 00001de4c2000037 R12: 0000000000000012
[  216.328095][ T7652] R13: 0000000000000000 R14: ffffc90003517228 R15: 1ffffffff1bca646
[  216.328111][ T7652] FS:  00007f44eb8da6c0(0000) GS:ffff888125fda000(0000) knlGS:0000000000000000
[  216.328131][ T7652] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  216.328147][ T7652] CR2: 00007f44ea9722e0 CR3: 0000000066344000 CR4: 00000000003526f0
[  216.328168][ T7652] Call Trace:
[  216.328178][ T7652]  <TASK>
[  216.328199][ T7652]  _prb_read_valid+0x672/0xa90
[  216.328328][ T7652]  ? desc_read+0x1b8/0x3f0
[  216.328381][ T7652]  ? __pfx__prb_read_valid+0x10/0x10
[  216.328422][ T7652]  ? panic_on_this_cpu+0x32/0x40
[  216.328450][ T7652]  prb_read_valid+0x3c/0x60
[  216.328482][ T7652]  printk_get_next_message+0x15c/0x7b0
[  216.328526][ T7652]  ? __pfx_printk_get_next_message+0x10/0x10
[  216.328561][ T7652]  ? __lock_acquire+0xab9/0xd20
[  216.328595][ T7652]  ? console_flush_all+0x131/0xb10
[  216.328621][ T7652]  ? console_flush_all+0x478/0xb10
[  216.328648][ T7652]  console_flush_all+0x4cc/0xb10
[  216.328673][ T7652]  ? console_flush_all+0x131/0xb10
[  216.328704][ T7652]  ? __pfx_console_flush_all+0x10/0x10
[  216.328748][ T7652]  ? is_printk_cpu_sync_owner+0x32/0x40
[  216.328781][ T7652]  console_unlock+0xbb/0x190
[  216.328815][ T7652]  ? __pfx___down_trylock_console_sem+0x10/0x10
[  216.328853][ T7652]  ? __pfx_console_unlock+0x10/0x10
[  216.328899][ T7652]  vprintk_emit+0x4c5/0x590
[  216.328935][ T7652]  ? __pfx_vprintk_emit+0x10/0x10
[  216.328993][ T7652]  _printk+0xcf/0x120
[  216.329028][ T7652]  ? __pfx__printk+0x10/0x10
[  216.329051][ T7652]  ? kernfs_get+0x5a/0x90
[  216.329090][ T7652]  _erofs_printk+0x349/0x410
[  216.329130][ T7652]  ? __pfx__erofs_printk+0x10/0x10
[  216.329161][ T7652]  ? __raw_spin_lock_init+0x45/0x100
[  216.329186][ T7652]  ? __init_swait_queue_head+0xa9/0x150
[  216.329231][ T7652]  erofs_fc_fill_super+0x1591/0x1b20
[  216.329285][ T7652]  ? __pfx_erofs_fc_fill_super+0x10/0x10
[  216.329324][ T7652]  ? sb_set_blocksize+0x104/0x180
[  216.329356][ T7652]  ? setup_bdev_super+0x4c1/0x5b0
[  216.329385][ T7652]  get_tree_bdev_flags+0x40e/0x4d0
[  216.329410][ T7652]  ? __pfx_erofs_fc_fill_super+0x10/0x10
[  216.329444][ T7652]  ? __pfx_get_tree_bdev_flags+0x10/0x10
[  216.329483][ T7652]  vfs_get_tree+0x92/0x2b0
[  216.329512][ T7652]  do_new_mount+0x302/0xa10
[  216.329537][ T7652]  ? apparmor_capable+0x137/0x1b0
[  216.329576][ T7652]  ? __pfx_do_new_mount+0x10/0x10
[  216.329605][ T7652]  ? ns_capable+0x8a/0xf0
[  216.329637][ T7652]  ? kmem_cache_free+0x19b/0x690
[  216.329682][ T7652]  __se_sys_mount+0x313/0x410
[  216.329717][ T7652]  ? __pfx___se_sys_mount+0x10/0x10
[  216.329836][ T7652]  ? do_syscall_64+0xbe/0xfa0
[  216.329869][ T7652]  ? __x64_sys_mount+0x20/0xc0
[  216.329901][ T7652]  do_syscall_64+0xfa/0xfa0
[  216.329932][ T7652]  ? lockdep_hardirqs_on+0x9c/0x150
[  216.329964][ T7652]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[  216.329988][ T7652]  ? clear_bhb_loop+0x60/0xb0
[  216.330017][ T7652]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[  216.330040][ T7652] RIP: 0033:0x7f44ea99076a
[  216.330080][ T7652] Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
[  216.330100][ T7652] RSP: 002b:00007f44eb8d9e68 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
[  216.330128][ T7652] RAX: ffffffffffffffda RBX: 00007f44eb8d9ef0 RCX: 00007f44ea99076a
[  216.330146][ T7652] RDX: 0000200000000180 RSI: 00002000000001c0 RDI: 00007f44eb8d9eb0
[  216.330164][ T7652] RBP: 0000200000000180 R08: 00007f44eb8d9ef0 R09: 0000000000000000
[  216.330181][ T7652] R10: 0000000000000000 R11: 0000000000000246 R12: 00002000000001c0
[  216.330196][ T7652] R13: 00007f44eb8d9eb0 R14: 00000000000001a1 R15: 0000200000000080
[  216.330233][ T7652]  </TASK>

The check comparing "blk_lpos->next" must decrement 1 as well.

Alternative:

The check can be removed. Instead we might add a check for invalid
*data_size, something like:

	if (WARN_ON_ONCE(!data_check_size(data_ring, *data_size))
		return NULL;

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk_ringbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 839f504db6d3..1272c220c8b4 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -1262,7 +1262,7 @@ static const char *get_data(struct prb_data_ring *data_ring,
 
 	/* Regular data block: @begin less than @next and in same wrap. */
 	if (!is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next) &&
-	    blk_lpos->begin < blk_lpos->next) {
+	    blk_lpos->begin < blk_lpos->next - 1) {
 		db = to_block(data_ring, blk_lpos->begin);
 		*data_size = blk_lpos->next - blk_lpos->begin;
 
-- 
2.51.1

Another question is whether this is the only problem caused the patch.

> We may want to revert the commit until we can take a closer look at
> this.
> 
> I will divert my energies from code-reading to trying to reproduce this.

It might help to fill messages with a fixed size which might trigger
blk_lpos->next == 0 in the 1st wrap.

I could try this tomorrow. It is getting late here. But I wanted
to send my thoughts ASAP.

Best Regards,
Petr


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
