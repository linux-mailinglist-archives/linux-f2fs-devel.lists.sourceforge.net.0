Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MApKCIWECmqv2AQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 May 2026 05:16:21 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED745655D1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 May 2026 05:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhFzvbo3W4m/uz8ZZG4xMXXypXSDhMxhxxyRkXzKeBo=; b=a0UaZCbG9REzGIuR5YsrEe8rDf
	FesfQJEhZG9HUC3MIrffVrPQjtQSnuCZBelq49jHzGK3TocRKa7jFaNGPtkgNegp/JJYak2IJU94F
	ooFmBqPogZEubF0AZJIS2tk/oW3P7pTlencqV0lC6wmEDVtf8Ogx0HgRGRVq0Lkdee7s=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wOoSb-0001xA-Gy;
	Mon, 18 May 2026 03:16:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ziyuzhang201@gmail.com>) id 1wOoSZ-0001ws-LS
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 May 2026 03:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GMxs3iNJlehoJPgOCwQ1esuK+DKjdBD4wwRXjfUyqM0=; b=JYL0ksczEaj6RQfmKGjgIBq0NG
 ApiUBAzSxdsm+IAwzoB4ezJM1+5xcBJqp4BlM0dA9qb1e9EwNrjfribHpSeUTG9vcok5WnQpCYHs+
 TO1vPVMjECCjGpL6YiDYbGKoCRs14m7eK7TjgXHyR7z+QUTT0LHA84wVgi6wrsyI0YXA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GMxs3iNJlehoJPgOCwQ1esuK+DKjdBD4wwRXjfUyqM0=; b=mTTsuCioRQw0hBZH5Wod3xkSBT
 +KNiUqXV5QRM6UYNIy+N5BMiQt4DRZGwITwUpTmJdUycL6+J7Fv23wdWyWO+bsSz9KJ97az5wMfLq
 8YNyRj06F9zdFkGz9eanqAE5dICcBE+/AILkwBC6yXY7GSIVbQgscqsTx7+9RSiOTDW0=;
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wOoSX-00048K-8N for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 May 2026 03:16:04 +0000
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48910865133so583245e9.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 17 May 2026 20:16:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779074150; cv=none;
 d=google.com; s=arc-20240605;
 b=KdlrizflHwYR5lSGwgu7J+Eg5kkVNjlg0lf29IDZ8Jrwln4FHZ76bHhg0/FrWubQrC
 DKknNiXSo1boblRVJZWDm8XG3CAyP4z0O4FJAibc0H/GXKLF3qVbzV8JOSKGB9AzqDO0
 A6eXnPpQb9wp3l/K/jikepwsFC7CfL3w56LwroqRvhzGP8yDIQv5hjjKPsEx3lBZzZo4
 w3PZmr7c726OUwDweeXYgaWWPQzFavBcIBPRMFmYo/MCJ2osTtbjhqRGFfLjIpiZEOuv
 hDelluQhAwzZPG2gU6OicuGGvx1VuCWlPs7q5SkwNYs0y82hKHzvlYS9HMZnTTn7Whj1
 OPMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=GMxs3iNJlehoJPgOCwQ1esuK+DKjdBD4wwRXjfUyqM0=;
 fh=i7bAbnIT8FWMPyTlVR9sFvHDc3bVEAJQxLvKRj60yO0=;
 b=S9l1YTyfSExjxOXSCOFspJOzLKfV5Gp9ZEXBMubuDaAptJVaKV+PexN0JBCOV89cT8
 D4yoJfvnj+n2EoY+lLoqc99RRP++zbFy7l8ESVny3SxMezmL/VaIz4eiqwlkptHMB7Cz
 BBtwnIRtbrK+hSXM7tdJNaD+OpW5keMThzK/sxmmanHHv2McQQFpqV9Kk6W6JDTbS3N3
 Zt6LL2rIrIIkRk46GlKiUOjHbXsnDGJXi69nhZ9Y4OI9wdq9LXoF06q3YM1OyeaqzMsj
 vbdc9seM9QmIulCmxUr7RUAn53dMmqmL9R/gu645nHWx2CBRWzxOhWGPe0MlDG2AviN7
 8NNw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779074150; x=1779678950; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GMxs3iNJlehoJPgOCwQ1esuK+DKjdBD4wwRXjfUyqM0=;
 b=XQuWlfz5t2tlolqi1zG9n+Id0LPVvT1SCbJWfJ6/cVHMa/Fr+ERNGd6QGxpxAhzhqB
 Tkm50Ncxt2+jk5KPcOU/ivcmAmwG3sN1vO6b66Y68DfAJnzgKz/jCQYFdwX71t1ILnc8
 LWcHtYNOjtkXspZdGJdhmkmAQBxX87+//54A01/4J8f/ihlOvr34hFrMJ9pC9Y9WlZsD
 xW4LT1cD9uN5R7zNjCjE8XED+owXrJzVaWX+qWu0mmrijmYXKenzNTG1iepwlMJeWlT8
 hFsPE7Q6qihwfVHwnwma1CmFTwSvnJmrhqyLT766sTF3kncJuatSQTawJP53wVZ/c1IU
 vkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779074150; x=1779678950;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GMxs3iNJlehoJPgOCwQ1esuK+DKjdBD4wwRXjfUyqM0=;
 b=UD09JdxKK8FPYT70Bp1dlm3FjqU4kYpNBTLLpv3UsMUSKmbF1DYg8n9YKp7alM/qFB
 oApKONQYerckayrYPDuTCKuQzwEAVSPyz+mq+nXzWJlPSIy+MSb4tV9v4NxWdyba4hDW
 g5AkV5u1zTglkxLdhuv9Hpd2v73w5z0uKrBuuc7v+BKw9VgjVQEPB6ThPobLsVuHaL23
 WBRgQ/UbbxeJFJf5KPDYL+HZ0Mu1eZT/vRQIFZ/U87nuHS9UNSJUZYQdofs/8+AmsVZH
 WPuk+TLu7Bf/oM7Fgwb8/rCMGcfDgEvhwWs3lwY7Y+mSFHVM+3wlToI17wrr5RiPniyK
 iJew==
X-Forwarded-Encrypted: i=1;
 AFNElJ/I4kK7cX4UUo21vKq8nB6z2qXNcJTm5fMvPo2gsVHxNyCKzUjkKkDI2nLJvCWCEMovKks92Ii1USV63QGTuNHj@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwpSV+dPYF5qByZKRnzurh+WIcElhGQuntBjE6rN3M3Myd1/Od6
 iIsqwfJ6WGCuJDMJCjQjh3YJyoVIyLk+madAE6CSbEp2FC/ygLNQrDTPrBz87KOxM8Gy0q5VwdT
 OYtZ+3XxnAMi0OIU0pioAAbkP3SFZ91g=
X-Gm-Gg: Acq92OER3VLucjz0MddNLNRBTttxP3vWoXXUMemYlLB4tLNqwcNSFuNCetu0zVV88gG
 goXBNIUbj1Zregm4vKKsXZ+FcM52iIXZ65VqAWfrxiwpOXEX8rOjLZmsvA4NRZxpXL4HhJHJ4UM
 YX87LFk/UYRry/0DZSIdrwvzNsfr2uDxWUD1Sz87+nIIApYYyDB+npCGX7NjnZN4y7hDHhDvm/f
 5XvTczpCIRFyBscdffnZNRMyuYThxzVcWN1hx895ADnKfk6BCfaj5xR8YdOf/9OaQN/azeX6ASC
 5k2jWWdkF5Gw+ErmEAYuHcVKa899
X-Received: by 2002:a05:6000:228a:b0:44f:ef6a:cd74 with SMTP id
 ffacd0b85a97d-45e5c5ce4f6mr8669555f8f.7.1779074149870; Sun, 17 May 2026
 20:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260516035001.272335-1-ziyuzhang201@gmail.com>
 <f48fd685-21ae-4f1d-9a16-0f926f5e0e61@kernel.org>
In-Reply-To: <f48fd685-21ae-4f1d-9a16-0f926f5e0e61@kernel.org>
From: ziyu zhang <ziyuzhang201@gmail.com>
Date: Mon, 18 May 2026 11:15:38 +0800
X-Gm-Features: AVHnY4JaUt2vcn5lIJI879GJThC2RjcgZv4YL1zT7eDmM41ds1xwSS24sRe4dV4
Message-ID: <CACPoYJzBtLfxFJOq-FZdOu-06iJ4j80bCJMkCQygJ_OGKMYkrg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, 17 May 2026 at 17:22, Chao Yu wrote: > > On 5/16/2026
 11:50 AM, Ziyu Zhang wrote: > > gc_thread_func() tests gc_th->gc_wake and
 then clears it with > > separate plain accesses. sysfs gc_urge [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [ziyuzhang201(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ziyuzhang201(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.42 listed in wl.mailspike.net]
X-Headers-End: 1wOoSX-00048K-8N
Subject: Re: [f2fs-dev] [PATCH] f2fs: make gc_wake test-and-clear atomic
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
Cc: gality369@gmail.com, zhenghaoran154@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, baijiaju1990@gmail.com,
 zzzccc427@gmail.com, r33s3n6@gmail.com, Jaegeuk Kim <jaegeuk@kernel.org>,
 hanguidong02@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 3ED745655D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:gality369@gmail.com,m:zhenghaoran154@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:baijiaju1990@gmail.com,m:zzzccc427@gmail.com,m:r33s3n6@gmail.com,m:jaegeuk@kernel.org,m:hanguidong02@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ziyuzhang201@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziyuzhang201@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net,kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Sun, 17 May 2026 at 17:22, Chao Yu <chao@kernel.org> wrote:
>
> On 5/16/2026 11:50 AM, Ziyu Zhang wrote:
> > gc_thread_func() tests gc_th->gc_wake and then clears it with
> > separate plain accesses. sysfs gc_urgent writes set the same flag and
> > wake the GC thread. If a sysfs writer stores true between the GC
> > thread's load and store, the later store false can clear the new wake
> > request.
>
> I can accept calling "echo 1 > gc_urgent" multiple times, but f2fs only
> trigger one time, because it's rare to change to urgent mode, and there
> should be no multiple users of this mode in Android.

Thanks for the clarification. I agree that if gc_urgent is intended to be a
mode switch rather than a counted request, multiple writes to gc_urgent do not
need to translate into multiple GC runs.

In that case, the practical impact of this atomicity violation is very limited:
the repeated wakeups may be coalesced, but gc_mode still records the urgent
mode and the GC thread also has the timeout fallback.

>
> >
> > Store gc_wake as an atomic_t. Use atomic_read() for the wait
> > condition, atomic_xchg(..., 0) in the GC thread, and atomic_set(..., 1)
> > in the sysfs trigger paths. This makes the consume-and-clear operation
> > atomic with respect to new wake requests: a set before the exchange is
> > consumed by the current iteration, while a set after the exchange stays
> > pending for the next wait.
> >
> > Fixes: d9872a698c39 ("f2fs: introduce gc_urgent mode for background GC")
> > Signed-off-by: Ziyu Zhang <ziyuzhang201@gmail.com>
> > ---
> >   fs/f2fs/gc.c    | 7 +++----
> >   fs/f2fs/gc.h    | 2 +-
> >   fs/f2fs/sysfs.c | 4 ++--
> >   3 files changed, 6 insertions(+), 7 deletions(-)
> >
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index 098e9f71421e..71e40e4083ad 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -49,15 +49,14 @@ static int gc_thread_func(void *data)
> >               wait_event_freezable_timeout(*wq,
> >                               kthread_should_stop() ||
> >                               waitqueue_active(fggc_wq) ||
> > -                             gc_th->gc_wake,
> > +                             atomic_read(&gc_th->gc_wake),
> >                               msecs_to_jiffies(wait_ms));
> >
> >               if (test_opt(sbi, GC_MERGE) && waitqueue_active(fggc_wq))
> >                       foreground = true;
>
> If we trigger gc_urgent before, and then trigger again here, atomic_xchg()
> will clear the new wakeup request as well? unless we record the total request
> count into atomic variable.
>
> Thanks,

You are right. atomic_xchg() does not make gc_wake a counted request.

My patch only makes the existing boolean consume-and-clear operation atomic
with respect to an interleaving store. It still preserves the current boolean
semantics, where multiple gc_urgent writes may be coalesced into one wakeup.
If f2fs wanted to preserve every individual gc_urgent write as a separate
request, then a counter would be needed instead.

Given your explanation that this is not the intended semantic, this patch is
probably not worth changing the code for.

Please feel free to drop it.

Thanks,
Ziyu

>
> >
> >               /* give it a try one time */
> > -             if (gc_th->gc_wake)
> > -                     gc_th->gc_wake = false;
> > +             atomic_xchg(&gc_th->gc_wake, 0);
> >
> >               if (f2fs_readonly(sbi->sb)) {
> >                       stat_other_skip_bggc_count(sbi);
> > @@ -214,7 +213,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
> >               gc_th->boost_zoned_gc_percent = 0;
> >       }
> >
> > -     gc_th->gc_wake = false;
> > +     atomic_set(&gc_th->gc_wake, 0);
> >
> >       sbi->gc_thread = gc_th;
> >       init_waitqueue_head(&sbi->gc_thread->gc_wait_queue_head);
> > diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> > index 24e8b1c27acc..65e5b062a0d3 100644
> > --- a/fs/f2fs/gc.h
> > +++ b/fs/f2fs/gc.h
> > @@ -56,7 +56,7 @@ struct f2fs_gc_kthread {
> >       unsigned int no_gc_sleep_time;
> >
> >       /* for changing gc mode */
> > -     bool gc_wake;
> > +     atomic_t gc_wake;
> >
> >       /* for GC_MERGE mount option */
> >       wait_queue_head_t fggc_wq;              /*
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index f736052dea50..6ca5943450d5 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -586,7 +586,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
> >               } else if (t == 1) {
> >                       sbi->gc_mode = GC_URGENT_HIGH;
> >                       if (sbi->gc_thread) {
> > -                             sbi->gc_thread->gc_wake = true;
> > +                             atomic_set(&sbi->gc_thread->gc_wake, 1);
> >                               wake_up_interruptible_all(
> >                                       &sbi->gc_thread->gc_wait_queue_head);
> >                               wake_up_discard_thread(sbi, true);
> > @@ -596,7 +596,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
> >               } else if (t == 3) {
> >                       sbi->gc_mode = GC_URGENT_MID;
> >                       if (sbi->gc_thread) {
> > -                             sbi->gc_thread->gc_wake = true;
> > +                             atomic_set(&sbi->gc_thread->gc_wake, 1);
> >                               wake_up_interruptible_all(
> >                                       &sbi->gc_thread->gc_wait_queue_head);
> >                       }
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
