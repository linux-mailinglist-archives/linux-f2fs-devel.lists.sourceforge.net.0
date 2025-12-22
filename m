Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA99CD4948
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Dec 2025 03:49:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrn+29Jz2D6n3vGfN3KwWYHIJuTC7gsNbTZCLICvPqw=; b=JUShr8pCc4MbxD96BafGcI/O/g
	DBYFmVWI0WYtf96YlgXAi744tt6r9R9QVcTNfr7BsR1nZqt+NUOjw9PBhYO5JyRWwS6E3wIb/9fsL
	F6AHrvKHHQa+v4EqFFsXTupy2RG3bWtvur1wyKq/j5EakHusTEU3tQ+qhT0pnreMtNuE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vXVyo-0005NM-Oi;
	Mon, 22 Dec 2025 02:49:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joannechien@google.com>) id 1vXVyn-0005N5-7T
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Dec 2025 02:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CwSTfOK2PQKjAWo+5ivUdXM7DoFjB7pfUDLS+oPx57g=; b=Dw2EtWKce2ldILuFevJ5aCt/gG
 eeI2uOih9BQOzRkGMDM02RZCm3W/txAr1PJduIXWtwG1ZyxRN4pHJ7Ao3WWyPzmUmqsKE66gKQ+iV
 sm6xhjUDyXA+LluVt9Bj48NYai0EslyBNdnijRputHRy0ESxIi0h4qP5JsWe4N+JZd0c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CwSTfOK2PQKjAWo+5ivUdXM7DoFjB7pfUDLS+oPx57g=; b=PjbQM5Ft45ak13rYnhOtet7hRs
 yH3tjpG3f5WRKkLaT3J6QaKpKPjslYm51LCnJhZUiLMrnMy2tCiLrtxb50ZocrYtE6MGS+NNcbrQd
 oXb4l+Iw1fMJtQdcBDfEt4aj87R4/C0D2loPV2s+XFpcm1J0+rtBPFjQcqPJmlwINmkY=;
Received: from mail-ed1-f45.google.com ([209.85.208.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vXVym-0007r4-L6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Dec 2025 02:49:01 +0000
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-64baa44df99so16157a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 21 Dec 2025 18:49:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1766371734; cv=none;
 d=google.com; s=arc-20240605;
 b=E0LBFA4nSOT2rSGfeaClpKOy6xEI+S0yJDIY6ARaeBVcr+qn4/rS6IqNVxm/YEx3BG
 d/yNhWBonlqRTYPA88ojfk4ix3BfpDFIQPjx4vf3bb/m0olbuxEOacjBsI5vHcyKyjUG
 gAmGFWjzHBM2PqWPf3abKFxmYZazTgVMTUtUGtQ8vmMmakK8XFlZ0ixj3iO5rc0M07HX
 CylZo6orOn/E3QW8hvwsD/5Tg+ur0pWNFIiDAu6gmmfAiuvK67yXBrepFayC2DUSf7Oz
 NqeQkEhpgvXaLL5+40yGTBRW8lAnrhTZRl+OlaKSiT5ixL2VAsAaBtEDpIfkYVGLX+Md
 QUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=CwSTfOK2PQKjAWo+5ivUdXM7DoFjB7pfUDLS+oPx57g=;
 fh=kGdQ/i75GhzMxMbgZCe87BMVCrXdvvogx3K3crw5hsQ=;
 b=UhGZ7rKjCApDxJyd8BUyXXo1yKKPmMhoGxSeU3onr9mkdbmYHtUhJtpNNZ2fQd7YIl
 xdfYzIPO6nECzdxvINkP8pgfbnl6I+Rzx/AAoofEgW53ewEeYLICrs5JE0N3V4pGg2fG
 xs1zqH3becBItjgUigVdSwTXPdJrNfGFZyz2vGr6VaEvLJEpKxDTafB3h3+xrJ60GueZ
 54ROeurMaZKaNSv6/c7GRvgHLmL6vsH2gwgP9u52Pdmg7lZNTs2cui0vuch2v9ghwmC6
 bhNJcN6vWan3uQsWUWnGsKQupIGkwtmXFiMA218uF0Mob1T/+c2IPhMW+Mu5Qi7uHxoH
 HiEg==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766371734; x=1766976534;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CwSTfOK2PQKjAWo+5ivUdXM7DoFjB7pfUDLS+oPx57g=;
 b=kASliv7JJJNUSHcxuShVto5WPYsaL8nD1O8J8imfjRXfLTXCIq5kbaBUKUVyleQQm9
 KbROMSBZ4hvohD2puuXFB1L5ICjczviyD7mKhmz1Br1s4DS+xhoLukoVGpWmlbFYx5dl
 KSXmWydgG4G6asdPQo1BsRRoxifC5U8jx23iaAz9x04ZI7yi9C/Kti3GKCu2GCD/3mCy
 RXjkWNXccCtnUk66X9vx6LxH5RqEwsmCvlU6b3sM5xTAIHhdgyJlSeT8t+7B2wlZCJZL
 wsJRLDBuuT8Rg25KzHe72ukTt55ClIaT907acha7HcuRQF3aNijp8ShAjvOhYbWjbfBs
 j1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766371734; x=1766976534;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CwSTfOK2PQKjAWo+5ivUdXM7DoFjB7pfUDLS+oPx57g=;
 b=QCBttFRzeVB/KPMHnZMgLZ8TMVvejaaRuVlTcnH7cjloVA6zvIsN25M1N/DzqcyJww
 Y/BEITMC3iUHp8DTi8CVSsF/Z0S+ecQU9AEFTaiD2yTw+gOVSgcsjsuJnYjJ/ub/QGNi
 xC6Z1tOkori5MuIKGX5vlMaAATD1lJjx/RbBE77FgSgxY00W0/mBOeZ/r/NC5AgVyS8A
 TuK/YuUEAFTQmXL7N4nukpAdhsRDO9Zy5vpq1obwfF5m9js2q+mYoha9tEu5+ja1PcsB
 EPRHogNLNpwxCUS54+CvAd7jlspDOmVR8pze3nO5RMP7PvgGJG30+VnXT5zyVJd497FG
 shng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIPSVLLqd7i2SkEp1q6nuo3+NloLiHqwIVn8A4bvl2Sp503+L17ZX3HQXvfjbXHLvsQ49FicHbZ+kRONFduQsi@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzLDJN6trJXXcYbO/lQ0wZ/nBFnSjEJT1prL31Xqdw1fHb8eb0E
 mfrbyQ5r1x4qObbEVLyjDsXXCS+g9b2GUQtEki1rukwQ6hYMi7vMR3RN3P57DPpBlIqLrJ161CK
 DBewt2urSq8zdRskoX93yW0JoFrgKe8QmOtEL3Nxl
X-Gm-Gg: AY/fxX6WPjQ5NBCtBq2Tv+Tl/Rr84Tls0lHcxIsJUoMrAJeczfDeBUskii+cyTBE024
 Up6CIR7dSvafwrsxrVE/LeMyzDZvYLqKzsZTES3tojnxQ9QK+gYTExaHRsYuEMS2f8wE8gw+jwS
 39TtIISL2Gp59I4N3Dby+t650XTxFxx0ljtJzurhSv/IGbU10x7QcIadjxPovLSXwv265+l9YUs
 Bmdskb8uJeKcnZqvjWlhUZLaSx1McoMba4YkAYYY4klytI5iA7l2Kzft2iSebPK2djavVEUUM7m
 t3VJS4/9hZ93N9KGdNrQcYMQXOC2u9hoaXq+
X-Google-Smtp-Source: AGHT+IGICnv+CNulcBUQj4EVMqHrV4XCI9DVrr3ZNtTi17PvRnxG9nGncqdET6iqs+YBkatoM7bhDOnN+T+cZex2OlM=
X-Received: by 2002:a05:6402:1753:b0:643:6984:cee9 with SMTP id
 4fb4d7f45d1cf-64d065c43f6mr35946a12.12.1766371733804; Sun, 21 Dec 2025
 18:48:53 -0800 (PST)
MIME-Version: 1.0
References: <20251218071717.2573035-1-joannechien@google.com>
 <aUOuMmZnw3tij2nj@infradead.org>
 <CACQK4XDtWzoco7WgmF81dEYpF1rP3s+3AjemPL40ysojMztOtQ@mail.gmail.com>
 <aUTi5KPgn1fqezel@infradead.org>
 <CACQK4XCmq2_nSJA7jLz+TWiTgyZpVwnZZmG-NbNOkB2JjrCSeA@mail.gmail.com>
 <aUUymqMO4RfK8thK@infradead.org>
In-Reply-To: <aUUymqMO4RfK8thK@infradead.org>
Date: Mon, 22 Dec 2025 10:48:37 +0800
X-Gm-Features: AQt7F2p6Hjd_Nc7T5OEAyJgKQ5pr8sxJsosqYLA4O1HbB9YpKCqF7Pm762ItbGg
Message-ID: <CACQK4XAyDLfOcPWpRzKd+VXA5EtvzVNkxrZC9hjNJjx0uHx=Tg@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Dec 19,
 2025 at 7:10 PM Christoph Hellwig <hch@infradead.org>
 wrote: > Well, for the file size you can test by doing a truncate to the
 expected > size and _notrun if not supported. I can't rea [...] 
 Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.45 listed in wl.mailspike.net]
X-Headers-End: 1vXVym-0007r4-L6
Subject: Re: [f2fs-dev] [PATCH v1] generic/735: disable for f2fs
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
From: Joanne Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Joanne Chang <joannechien@google.com>
Cc: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBEZWMgMTksIDIwMjUgYXQgNzoxMOKAr1BNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gV2VsbCwgZm9yIHRoZSBmaWxlIHNpemUgeW91IGNhbiB0
ZXN0IGJ5IGRvaW5nIGEgdHJ1bmNhdGUgdG8gdGhlIGV4cGVjdGVkCj4gc2l6ZSBhbmQgX25vdHJ1
biBpZiBub3Qgc3VwcG9ydGVkLiAgSSBjYW4ndCByZWFsbHkgdGhpbmsgb2YgYSB3YXkgdGhhdAo+
IGVhc3kgdG8gZGlyZWN0bHkgY2hlY2sgZm9yIHRoZSBudW1iZXIgb2Ygc3VwcG9ydGVkIGJsb2Nr
cy4KCkkgZ3Vlc3Mgd2UgY2FuIGNhbGN1bGF0ZSB0aGUgYmxvY2sgbGltaXQgYnkgX2dldF9tYXhf
ZmlsZV9zaXplKCkgLwpibG9ja19zaXplLiBIb3dldmVyLCBJIGFtIGNvbmNlcm5lZCB3aGV0aGVy
IHRoaXMgbWV0aG9kIG1pZ2h0IG1hc2sgYQpyZWdyZXNzaW9uIHRoYXQgcmVkdWNlcyBhIGZpbGVz
eXN0ZW0ncyBzdXBwb3J0ZWQgZmlsZSBzaXplLiBTbyBJCndvbmRlciBpZiBleHBsaWNpdCwgaGFy
ZGNvZGVkIGxpbWl0cyB3aXRoaW4gdGhlIGhlbHBlciBmb3Iga25vd24KYXJjaGl0ZWN0dXJhbCBj
b25zdHJhaW50cyAobGlrZSBmb3IgRjJGUykgd291bGQgYmUgc2FmZXIsIGFzIHdlIGNhbgplbnN1
cmUgdGVzdHMgYXJlIG9ubHkgc2tpcHBlZCB3aGVuIHRoZSBsaW1pdGF0aW9uIGlzIGludGVuZGVk
LgoKUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBoYXZlIHN1Z2dlc3Rpb25zIGZvciBlaXRoZXIg
bWV0aG9kLgoKQmVzdCByZWdhcmRzLApKb2FubmUKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
