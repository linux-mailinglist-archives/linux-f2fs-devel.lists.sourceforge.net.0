Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PnuHi4SCGqUXwMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 May 2026 08:43:58 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B931D55A843
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 May 2026 08:43:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRthrbtFCYweWCOBlGS+cGmE8afkmYwzyKFLvr9MQCw=; b=M9YYy0Vxxgpl7dDiTZlrbHP1ng
	RW5YdJclniihJD3iHdIYx8TnI+UDWFCbUu+xYWQfN5wlx5kj5zxEFX8pin3ZGvu96OL6mSEdVPJDl
	BU5FG6/KbhX9wDBQdrkdGQwjbRLFaLvEUxC2eDlUsJddLMDNdKvxmFd58asbHN0fpcuo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wO8kT-0007Pz-4S;
	Sat, 16 May 2026 06:43:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cedric.blancher@gmail.com>) id 1wO8kS-0007Pt-D2
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 May 2026 06:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9mxy2GpAHGinIR1PnXVMvug0ztGXvMspUp7huk1TMZs=; b=Fe/jIjgKz4O1oz+UNW7CHUwxvy
 ilE9hWZ862AEc+ZHQgGew4LLKjJYozXQiWtEEKWf/GVsFhp4XrbXqA4gw2gEHIrnwfaeVCnD18Qv5
 HL1QQKebgj8R5RjTFzgwSfm+FkTz83sGJ/y3irEOCoa0/aNZcRz/3U5xuGD7bbUUwwMg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9mxy2GpAHGinIR1PnXVMvug0ztGXvMspUp7huk1TMZs=; b=kn99JPIgpTzeF0eDbHt9QV9wtP
 Ny1ObelJH74BXP8cM4qXRbCaOH5JQy2rej+K6KbsnwtHGZtudTzID+9Xxk/jTmeYVnVsqQcGkgQ2w
 f9anYkasHDYX+gHyOvpVLzvey3tpXIAIa9E96haxcUjU+I6RkMv0layf44g900s/IpOI=;
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wO8kR-0005hx-Vq for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 May 2026 06:43:45 +0000
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-47c6f914617so307772b6e.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 23:43:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778913819; cv=none;
 d=google.com; s=arc-20240605;
 b=LbO30odD6tbMWV3QAlkz8IyOz3XXvoPl1H9wr0lUlV9igxm0vqrkK46wSPkdrcqmSC
 9f+Zp4U9tiUXEvSr3J2hfX2WcqADJPgBI/jc9zCQ7TpW8itsEmaCXNbRn57HnFg5mNkk
 0BegQxYYoMlYpGVLmrKsGlQZO1EAesgbtUlaftrvilLKC+wG2Om2QGyKs83T4QQsrikV
 eerz3k3bpmutRBUmTtiRuVAUOv6ZgE0etPyX9V88LwHBIK6ryQb50nrCsr7Peku6+Et4
 Wbjd8w/x5VhOkslWmvN62C3SkC2NdZ/9zAMWPNiXBIJJQPpELHjqzX7J1wr7XhshyviF
 B40Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=9mxy2GpAHGinIR1PnXVMvug0ztGXvMspUp7huk1TMZs=;
 fh=KaZbCatBe6PBuLUD3BfV7vtLfzhZKVQ2ry0PMvs0ml4=;
 b=fgHshbt4DCnT2HqoPL+9TbHGIyacpbWP9Cw2BpEe8zKr6ys4q+82ALRI/P0yYVJ1G0
 IrKo/ZbDX/WonfQv3OT4L5TB8l61Tz6WFBgS74G9ZmBfA3YiRzoyoOdXN0NFvxa/qB6t
 VfF5/vK1Ks2eU+swFli+Ck9NyMyzQLsJ11sJ1Hv48TCI8HmETBJisEqws8d2deonP0Wq
 W55M4BD3HNXp9G3sQZJDjcYTt8bnPUbOX6gldrUhne6GMcDh9ivDNZOC7knAaElPlieh
 qRRWpAKAT9XN5exEpP7R/HYF0puY9hF0LqS8XgggAncqzDe0WZ0hRplxM6wfrI0eRXwY
 5ogg==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778913819; x=1779518619; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9mxy2GpAHGinIR1PnXVMvug0ztGXvMspUp7huk1TMZs=;
 b=E2E4FFoeIBACkw7Mcg9Z0gXjWMyf7b5dU87tqjqAv6HjXEYVoYtTw1fYRrZu1PWuY1
 2srNxlElR+lrwwZ8b3UqrmPJ7KFeA0Z3idLF78GINvWs3ilUALHMU1SkZF3+QzDjLi1W
 +LXkgCbXYqeHI3yTLT//5YVklPWS17ky/syn2a4hLIuN2n8TPvRuaLcwfNtt4TR06Uwv
 nMcLE6zu8d/xbm+OGT6BFQ13FbjW8HoXRj0Tm2EL2cdfHTX3RQLIm2Q4gTFxVXFEFMFj
 G3NUSDObc1VFYAmt7R8qMSUwN4TVoQIIvv9KNj3+cm2R6grumQAM6oaz7ry7NulckRlF
 mvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778913819; x=1779518619;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9mxy2GpAHGinIR1PnXVMvug0ztGXvMspUp7huk1TMZs=;
 b=jfpPpH2L8csLzVm64Yb37sSy1LJHNn8nDIMW7GpU0SJez0e59EeQrYxY0HhSBf+np1
 vXe2NPfdpC+w0vdgo3Sc4ztEUIocIRH9DHq6AUhOkXRN06KGGmaUdqqS0+DfVNc4q1tU
 7QYhOTEkzttE5rGey6WXaoypiyjzRV2LCQJXy2UhtS0MSegmpqs9KLFJU+/IuLuHGqJ9
 Bct3jLDWIdxAokVO6mrgq5P3wlJD5peLwc04x+K9morNTeizpRe9Lc6q28zOr6YEuOrn
 PaQEihBScNTCRSH5easrjd7kBjehkpRFPmTGgSHVYz/TKVybpFXk2+9v91ey9mLy8Xi4
 0Tjg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8WNlVc5NZlVCjiKmZ/VGv+OSbCoSKcWDiflJ0FHdEo42dYaF/VBMWXXNPEHHgWmt4k8TX++5bKPC716jpgoLw9@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwcCRP1MRBpXdAlnpnaeaKQSvow7U2XeDsDjH+M0OvWgHic0fsD
 IUfiOSjHsVS/z9Rg7eePZxvqFbTsq+wogiJC0txPvHQik2HRRIcmowHrPnwWlNSZ/4v/LG/KtlK
 F/fGQ0ic7k1htS1Pkeek5crsEicqd9sA=
X-Gm-Gg: Acq92OENH91bFaURJSsqfxPGz3HdnoHjVBMEWCnOD89QSyHfT4eOqgvsH9rk+xlH2gp
 lBGNHk6wzM1NUhOVBehbszj6QGqJsJPpLQFNtpq8CCzNWwLMTPV0q73xrvWZ9O1SL4ZZLNq5wOn
 Jj8S0auEaHeQwCTFp3UNs4XXBiWgdb6QfNHSjm1jGa25sN68noFV6e6YVXsuXUdi/QeyJdWihxp
 JVt8NFBqhk6pOh/nJvpdB5UC/Er85HdwqDyW/mtpd1rUgKc9t9gW1Xegjj2wg0UrIRwNVU3jsMt
 uoK1W6yZOCrO7DlHFA==
X-Received: by 2002:a54:4e88:0:b0:46c:e542:cc3e with SMTP id
 5614622812f47-482e55e65a9mr3386045b6e.6.1778913818672; Fri, 15 May 2026
 23:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260507-case-sensitivity-v14-0-e62cc8200435@oracle.com>
 <20260511-wertverlust-vorbringen-070f016f3bd4@brauner>
In-Reply-To: <20260511-wertverlust-vorbringen-070f016f3bd4@brauner>
From: Cedric Blancher <cedric.blancher@gmail.com>
Date: Sat, 16 May 2026 08:43:00 +0200
X-Gm-Features: AVHnY4LulXSgBXmlt-XknhPT4FGQR5_lEWwUy9GN7jO6BYSv7kvOdT0vcpcWCyI
Message-ID: <CALXu0UdsurG-ayuYViqs0HXOfgyDw8gpNC+f=5y59cuuSPUbBA@mail.gmail.com>
To: Christian Brauner <brauner@kernel.org>, Chuck Lever <cel@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 11 May 2026 at 16:11, Christian Brauner wrote: > >
 On Thu, 07 May 2026 04:52:53 -0400, Chuck Lever wrote: > > Christian, let's
 lock this one in. I will post subsequent changes > > as delta p [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [cedric.blancher(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.182 listed in wl.mailspike.net]
X-Headers-End: 1wO8kR-0005hx-Vq
Subject: Re: [f2fs-dev] [PATCH v14 00/15] Exposing case folding behavior
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
Cc: pc@manguebit.org, yuezhang.mo@sony.com, cem@kernel.org,
 Roland Mainz <roland.mainz@nrubsig.org>,
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 linux-cifs@vger.kernel.org, sfrench@samba.org, slava@dubeyko.com,
 "Darrick J. Wong" <djwong@kernel.org>, linux-ext4@vger.kernel.org,
 linkinjeon@kernel.org, Steve French <stfrench@microsoft.com>,
 sprasad@microsoft.com, frank.li@vivo.com, ronniesahlberg@gmail.com,
 glaubitz@physik.fu-berlin.de, jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp,
 linux-nfs@vger.kernel.org, tytso@mit.edu, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, Chuck Lever <chuck.lever@oracle.com>,
 hansg@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: B931D55A843
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:cel@kernel.org,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:roland.mainz@nrubsig.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:djwong@kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:stfrench@microsoft.com,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:linux-nfs@vger.kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cedricblancher@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	FREEMAIL_CC(0.00)[manguebit.org,sony.com,kernel.org,nrubsig.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cedricblancher@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, 11 May 2026 at 16:11, Christian Brauner <brauner@kernel.org> wrote:
>
> On Thu, 07 May 2026 04:52:53 -0400, Chuck Lever wrote:
> > Christian, let's lock this one in. I will post subsequent changes
> > as delta patches.
> >
> > Following on from:
> >
> > https://lore.kernel.org/linux-nfs/20251021-zypressen-bazillus-545a44af57fd@brauner/T/#m0ba197d75b7921d994cf284f3cef3a62abb11aaa
> >
> > [...]
>
> Applied to the vfs-7.2.exportfs branch of the vfs/vfs.git tree.
> Patches in the vfs-7.2.exportfs branch should appear in linux-next soon.

@Chuck Lever Thank you!

Does that mean the support for case-insensitive filesystems will work
with Linux 7.2?

Ced
-- 
Cedric Blancher <cedric.blancher@gmail.com>
[https://plus.google.com/u/0/+CedricBlancher/]
Institute Pasteur


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
