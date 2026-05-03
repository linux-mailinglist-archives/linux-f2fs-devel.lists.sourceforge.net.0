Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCmrDX4g92n+cgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 03 May 2026 12:16:30 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB484B51E8
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 03 May 2026 12:16:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7UM9rPBICw9TIQd07llMmW2DSkwycWBK4ELSsMaK0I=; b=X2bAWOTFuHZ3jdb/QHbdK0b4do
	NU735hVvHEyJvnkiWuGoutHmZXMZbOIIQzV9sBW988eq67TKYf6FZBMP3FsjvK18a0RI6pRE51Ujj
	ojUCHWy8FxEG3FxkRiUVlPvpiR3/muo4+vyaLpi78owPs0EDDpsmd3m9yQ34GUNftFQA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wJTs5-0002Pe-P6;
	Sun, 03 May 2026 10:16:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zzzccc427@gmail.com>) id 1wJTs3-0002PX-ST
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 May 2026 10:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mR0B0k2rf+wBmZdVRF4H38tQ0gAjxaCOKzTZibop5YI=; b=PYsSWbFqkoyJutxeFiDCuBniQ3
 XAO2do2nzErFXJTd4esQ6De+uHytSR1n66JS25yNdbMLjhI4bLguOoVYB7upLGpZMmLtOEp8wb7t/
 T5SuDnPi04nP8MmCxuoohz6wXRXuElOwr9DL9fDHK06k0PIIAD7qTqly9J71v1nj4lLk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mR0B0k2rf+wBmZdVRF4H38tQ0gAjxaCOKzTZibop5YI=; b=PGCrvyLZdPJpmwnqndZNhV83gr
 ia1YUtP9B9nOWK8LflndjRxPEUodLBCqyS06chaaPpmBARqesifyq18oORm9DabhbfdBOClhJQNID
 Z2fEubqs1DseuagU32F483YxGtdQbfxzs8X5sfVro3RiPA6/JwvgjTz4dzfOylBVWLn0=;
Received: from mail-yw1-f177.google.com ([209.85.128.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wJTs3-0006Kk-EH for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 May 2026 10:16:19 +0000
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-79ea87af213so62098207b3.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 03 May 2026 03:16:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777803373; cv=none;
 d=google.com; s=arc-20240605;
 b=GWxdlMz6G7EcYopNbW5PPFrFmCWtsMZG+uluOJbIGh6mrzHGHxl93uIjlOKtjc43zY
 GqKoIjJu3tAOp5DRCbvZwCFCl2vHQokekddEoEtgF7IVLm905N9IlxK4UACIHtPwEsqB
 9OFGpVWvwD5XkNxKtS4Xl+QwLRdcuDwRO1ErXs1pSaeuYLCkgLEUFOaczHQfAA3AAPc9
 VfMW+TsJHA66GKrGm8i+focuXyu3wb1hw63Jht1bYi4qSR6ROUVwlN4cv0r5UX0qs7Nq
 Y4Nm1WTlctL97rD+TDtFg2JIcWqADW2OBIxzUbNS45hQudvMvCfRYmqyY7vPJs8puV1u
 vEoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=mR0B0k2rf+wBmZdVRF4H38tQ0gAjxaCOKzTZibop5YI=;
 fh=G16YnClNYPtwcXYEYhxPrCGzDmNkCFGzWwgiu2IEc4A=;
 b=D3oDPybptTjpdiz9wV9SdqXZUsCMZhF0FvJYescgE78cmZF5ytKX+5ZFNRWZMkStq+
 HV0maNyANC5cRIid456NpUMrccsBtQgWkYwaWNr/ln67q89AD/0zFILOA3yp4X2pGwsF
 TiwDvnsEzh2pUoXvWdHu7kk+2lsaUbJ2IoweYLIU2ZCZDpgBn4MZihLUn7OosAnvDKJ6
 2Y+xJQ5GURitJGufOaM8vKrmLM4Y9dT9UqeUgVjF4LxWN+cEWImWUpF60wGDBJGbQk3t
 agZt38TKlygt47083P7tXMxAbDRTQJpNzobki0iAyc4QTqla64UzQVJTZXcvLy8EGAVe
 421Q==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777803373; x=1778408173; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mR0B0k2rf+wBmZdVRF4H38tQ0gAjxaCOKzTZibop5YI=;
 b=PybvjQJTdvb+QGLDinBfhYQFqiY4VPScPBewWD8PZw6z8zt9zKTeyOf48QzESLCXoG
 Kud8QdhWsl/e3qib/N850WBkATQnpqYwJsdYSg+YqyF4pFtFH03m9zZITQ83+Pd3q/2T
 3p0FoUVJgPSCnDoWZMKFmoYenAnmEMq2ZVXxGwgwDwwYJnsS6D/hK4xp5ng/lHZUQpxX
 pmfDR18+j8Bc4qs4pEI5SwgShNPhp7KpZ8NClT9mHTQaB2kwyv4RfIbUkl5KyR2j2Abe
 17dnfH8TzZwwIbPR6p9EToWQhDxOS3SF2gI72Qb9M9DL0Tn5geacXLCUkf9twGtTWPcC
 oaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777803373; x=1778408173;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mR0B0k2rf+wBmZdVRF4H38tQ0gAjxaCOKzTZibop5YI=;
 b=Gvh1KDCiC88rO3eNx/sWGacIIohIMsnvvzz86nx+oPOBPZFsvN3sbxRIIUVu7aJ3th
 GwXlDIeZYcUmDGlidzLW9W+HFflYVNL+7/0Rsqmh42wsytR1ez16Bbz6uM+Gu0/Nb2wK
 fwe+IWXpsLCt8/4cYkr8G664LXOqS4+NbRITl/J1UarvBqfT+dcj9ulwGQqKwDQUN/gc
 AJQEZbFCADB05LfrX4/h8Q+fwS1l7/dpR9QM1XFAVoLfw55wGdfGl4QSwQv8LwgGMklW
 48lh8Ft1FpZ6FE9D5Pxh0DCBdr5Bj3JPN/+JCS/ef1XaBhyW1RrIaEzuUZIx4E6WjeMB
 wk/A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9+DUJ1cBDQtOsUamatWZnKW9Fr3awOaM6Y9ifR9PLmpRGmsPQlGVTdxWTY/PZQJzjF41nSNPULQ6d0stJr1xDj@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyXBw0vtOK3sjkq8/umuD0+iKXZNfyod9deGPhWQY9JLeKv3k8m
 p5756wku6bwfy8shy8kvC3gpYQYzn42FClS8GjYxtTNRASW3Z1kt1qj4rSsRgYKLYiFQ4C3SSZu
 clJCuZFz6n/2DHuaj91ziIkHvMYda3X8=
X-Gm-Gg: AeBDieuV9Qa/F+KiEpbpl6LKfwUdKyLjoh2s+PF+QmzMIipcSRvOfC06tbHMCEdSBhM
 kNRAv9XObR7t40chUF2XmMBMp10ZKogEhloxyYzcNfmdRIxnT6KHtF1ZazV5D0kvhgl7iDPsEP0
 ITi8IByRkGSYYcUJw92J5GLexsvKtBmYKT0XruJiUfqEAXNa0TVD4kO7+SODM6652DaRVAgpbGZ
 qaO7sWEUl0sQ6c8XgQ84sKjkzRWDGWkkHx1oln3YzGsYlQDjkWg97s/Wb0qZRy/EEi4i8azQj83
 aXgkmiKLDVNUxtjZ5co=
X-Received: by 2002:a05:690c:9988:b0:7a4:e4e5:390f with SMTP id
 00721157ae682-7bd5667100dmr97948917b3.21.1777803373535; Sun, 03 May 2026
 03:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260503045820.973718-1-zzzccc427@gmail.com>
 <2ba0b3ad-615e-43c8-a165-af631607a4c3@kernel.org>
In-Reply-To: <2ba0b3ad-615e-43c8-a165-af631607a4c3@kernel.org>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Sun, 3 May 2026 18:16:00 +0800
X-Gm-Features: AVHnY4KCTm8qrNVBQVDkJ9A8bpVDNk089SBcsGEZ2tVKGyMs9leP5hMPZ1__kJ8
Message-ID: <CAFRLqsUirEtA4+xxVkB9B71+eaqHa+nk78HxT-eAHEW2erJBBA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 1.5 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Dear Chao Yu Thanks for taking a look,
 and sorry for the confusion.
 > > On 5/3/26 12:58, Cen Zhang wrote: > > The discard command control is
 built while the segment manager is > > constructed, before the node manager
 is built and before mount recovery > > has complete [...] 
 Content analysis details:   (1.5 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.0 HK_RANDOM_FROM         From username looks random
 0.4 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zzzccc427(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zzzccc427(at)gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.177 listed in wl.mailspike.net]
X-Headers-End: 1wJTs3-0006Kk-EH
Subject: Re: [f2fs-dev] [PATCH] f2fs: start discard thread after mount
 recovery
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
Cc: baijiaju1990@gmail.com, jaegeuk@kernel.org, quic_stummala@quicinc.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 7DB484B51E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[zzzccc427@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:baijiaju1990@gmail.com,m:jaegeuk@kernel.org,m:quic_stummala@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zzzccc427@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,mail.gmail.com:mid]

Dear Chao Yu

Thanks for taking a look, and sorry for the confusion.

>
> On 5/3/26 12:58, Cen Zhang wrote:
> > The discard command control is built while the segment manager is
> > constructed, before the node manager is built and before mount recovery
> > has completed. Starting the discard thread from that constructor lets the
> > background thread run while f2fs_fill_super() is still publishing and
> > initializing mount-time state.
> >
> > After commit d6d2b491a82e ("f2fs: allow to change discard policy based
> > on cached discard cmds"), issue_discard_thread() may consult node-manager
> > memory thresholds through f2fs_available_free_memory(). It can therefore
> > observe sbi->nm_info while f2fs_build_node_manager() is publishing and
> > initializing it. The same early-start window also lets the thread test
> > the superblock read-only state while recovery paths still make temporary
> > SB_RDONLY transitions.
>
> Not sure I understood you correctly, do you mean this?
>
No, I did not mean the old UAF-style failure path. That path should
already be covered by the existing cleanup ordering:

free_nm:
        f2fs_stop_discard_thread(sbi);
        f2fs_destroy_node_manager(sbi);

What I was trying to describe is an earlier window during mount
initialization, when the discard thread is actually started:

- f2fs_fill_super()
  - f2fs_build_segment_manager()
    - create_discard_cmd_control()
      - f2fs_start_discard_thread()
  - f2fs_build_node_manager()
    - sbi->nm_info = f2fs_kzalloc(...)
    - init_node_manager() initializes fields such as ram_thresh, counters,
      locks/lists/bitmaps, etc.

At this point issue_discard_thread() may run concurrently and call
f2fs_available_free_memory(). That helper reads NM_I(sbi), returns true
only if it is NULL, and otherwise uses node-manager fields such as
nm_i->ram_thresh. So my concern is that the thread may observe a newly
published but still being initialized node manager, rather than a freed
one.

The data race report maps to the following paths in v7.0.3:

  issue_discard_thread()                fs/f2fs/segment.c:1921
    f2fs_available_free_memory()        fs/f2fs/node.c:50
      NM_I()                            fs/f2fs/f2fs.h:2228

racing with mount-time node-manager initialization:

  f2fs_fill_super()                     fs/f2fs/super.c:5151
    f2fs_build_node_manager()           fs/f2fs/node.c:3420

There is also a similar early-start window for the SB_RDONLY check in
issue_discard_thread(), since mount recovery can still make temporary
superblock flag transitions before f2fs_fill_super() reaches the stable
mounted state. The second report maps to:

  issue_discard_thread()                fs/f2fs/segment.c:1935
    f2fs_readonly()                     fs/f2fs/f2fs.h:3665

racing with mount recovery restoring the superblock flags:

  f2fs_fill_super()                     fs/f2fs/super.c:5267
    f2fs_recover_fsync_data()           fs/f2fs/recovery.c:953

So the patch is intended to fix this lifecycle ordering: keep the discard
command control available early, but defer starting the background
discard thread until mount recovery and node-manager initialization have
completed.

Please let me know if I missed anything here.

Best regards,
Cen


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
