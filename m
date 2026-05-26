Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MMGGkMYFWqQSgcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 05:49:23 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B566F5D0763
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 05:49:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njKmkqHgj36iaqX0d+iqOdSAxg4p9nuY0tumS2EycAE=; b=Zu/XA7uO2id1hFGgwqBsDgFybI
	Po9TZGrcRaClfdXl8jL9nJMSxOSrNH67pX4HwAVP0QaVaV3yge1F8DViJCMVdvvbSMcfYozpjp6lZ
	TOELLfob8lDCcXMyom1SxJZBvz2duPwNKBz8Bny7IdWASeA2+mWX2JVjdF2whjeknqz0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wRin6-0007yr-MJ;
	Tue, 26 May 2026 03:49:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wRin4-0007yb-U4
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 03:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mgQLebpf3UE3f5swxa112DCRAvK8dC6SXsYvSAwPC2o=; b=gdGR44aGMyDBGx+t38in2Ja5yL
 4SZpTl37ILAVGAcGlMRkKAI6Qes9Shl56af6Gv5c4DT6Jd9p0WtKbo9V0Brwg5KR2wzTmBYIRn6pq
 F8xa4ZzlBDH0B8bBgTocRs69B9292i6736gQW34w4Ds4ARLZ3YKjJr13jCWn1nBfcR/w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mgQLebpf3UE3f5swxa112DCRAvK8dC6SXsYvSAwPC2o=; b=WbgI3ANSaAJt2klnV6I37AG7tG
 sCLb0GRIWLZwzNjDzJNNyRsbioVPb9abwZEXNLB+5TcNYsIi9o0b+s3CErpNsqDDSWtNcCo5ywT7y
 BMbJgJn5Uxg52frhMOptegz2D+s238uLk9yZ83hVRV1CNtaY5xEqpm2bIrSZNwBQbSXI=;
Received: from mail-lf1-f46.google.com ([209.85.167.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wRin3-0007Dq-M2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 03:49:15 +0000
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5a40cfab24dso6330652e87.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 May 2026 20:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779767342; cv=none;
 d=google.com; s=arc-20240605;
 b=Z5lbndUnRSKN6opGdtIwHOpRUuqMfNPJSzn8kxvnO334OzRXEGYItpNIGCJmhK9Fig
 Eyob4qldSp7hdoN2DQGrxkzatlxO+1J9I6MQG4ajNrVQ3KRLDMhg+5Ot4Sh9yapGSn6/
 Td3R6nUEQLY2JuEhgJda1Uts80r/Eon6gE22NOpRyg5iNysQI9N1EVkb6vR9c5NIJlS9
 dMR34G2JiEkCe3y9JR16N9BiTgHSVDkRh+xt0gLJRuk5N2w8dhWjA5kdxZVIyJzn/QW+
 CVKZyo7t1sC0VljAOsF6Jnd7xJJA+kNEtFdM82lMM9Uz3ytw8ndUf/pUPdliX5h+vor6
 urJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=mgQLebpf3UE3f5swxa112DCRAvK8dC6SXsYvSAwPC2o=;
 fh=WhP6bPNGrWR5HNuKYdBwCcYV/8EbZtw7baVVDEhzCeI=;
 b=LFEOmLTlfSHmhqojFBnPXLIWK6TKnACe1w5rq4d7HoCKZSfr5fOnL/hACmhmaTpOwO
 d5RcwbqGIL0TNJKn7SBvjCED1FTGryN6piadCbq7qqcEkvlN77L0o1Et00J0AjwQsnH/
 +RhJsY8tY6MnGA2pHOOdsrALzm50612ZZeRSekdnOfQGqpOtIqkPz6ENj1y9877by3X6
 s9nHrjX1rUKmy9cnwdDZxpyoywK0H9pnh59+kqakzgeYkonlxjIkYMFujhbTrI//6wbL
 qjHKxfOKCEUxw6hyRslXUWf8rybN58DGYMSPRZe9X08NxB13ziEptOAZJn//OTkhId8D
 2xvw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779767342; x=1780372142; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mgQLebpf3UE3f5swxa112DCRAvK8dC6SXsYvSAwPC2o=;
 b=gI05LbASE6wGTXOEZEJtOaBO5MGYVEgCpa4p0szm0f2Yr21gFwUPIc9W03xelTm9Eb
 T675dzeJkcz80q+KxW+yowffeUu9FBoKWbulu6fiHUZVlyXjEefK5FW+LPxo6/dpahE5
 BrBcz6yFSuMQyS1fxriWD2M+FSP0/z+wQ4JsiroErOtuPR+8ZDc6QYRtdwZUA/YSfkP0
 ZMWjOoktlhE1qegWsDFo8Agh5qtlM95pMSt4RvuEG96vyhV/9lDYvV44j7mQ9I4XA+2Q
 IU0r4pPGLpfpuRklZ9X/kV5U1FBEgdqWtQply33ZVuYID7hrGVMVQ429YpcdNBappdH5
 FCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779767342; x=1780372142;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mgQLebpf3UE3f5swxa112DCRAvK8dC6SXsYvSAwPC2o=;
 b=Byzy0JT4KYUzbYSZ9ByaKH48SDAO6EJQUw0DtoTw8qhQzQr1dGHT+irPX+DTkL7hHQ
 Ei9plfERvMygYYZxqXt94S7KHWUZGFpeZRrdgs50ymmeZjund0wIOVz6CJKn1rB7rvLD
 xj+++Gz6yNUmeLGhWMIwpHexPiogPZPxXc2RUKaLIN8GGaMG07XOLVJLNDDdCH3j+4ge
 lRSa50WKJzUpSHrKC+ufbIQfC6zDpf6hGliGsxBhZnSQ4xalYmNbttkVg6kxn70f8oq5
 02eBBCPqr2N63xIdTzfEhMSGe9caQa3gU48+zAMB1R2491lCIXXa03DwZzJXHxGsku4k
 obbA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9mI4rnNqrCyMb5y33TmNjKQdtmJY+3ZV379cjAG6H0CX3oh4cLfqgfyzxDPYUeRqgUlZ4rv+I2F+86MtnyQIN6@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyAVdjBpBUbHU5obHI6Xt54ECjXNP1xh2lFkoa6Zz9jKjE1nStB
 FfTDOy9XxB88j3CCMsaU1Uz7rxD7+oJhE+aUQeePx9mdN5X81zUHIMpywGQmm2SPPjRqWpBrzk3
 ltcWfwSPTFzR+edjN1CMnkT+e+gy2UPU=
X-Gm-Gg: Acq92OGEA9Fh//SVR/r5B+34GEHsR6bdlivvZ8zsjlxm89J9qHa1gEkIWpjocwdpJrO
 DLibCb14WvxKx1odpGxdm4uDTU/j2mUgv9qKBjBC2nyplG5Vsz4Ttc9NwJ5iexmGVVN74FYEXqx
 sYlfQvnGgqEMhCZUv2sCoaVpyRX7sIJyjEsArhiN+cDuPrnb/B3y9p6+d7rof/haHOqUwDFA9BG
 v6qxdq1Rq5PGydWkimH+syI8MaZ3NfZwcVuWmd3WaDuKNvpiDV/sKVYctou1/tIErslZXh2mPo2
 y/v7jgzsyqo5JqmtIWY=
X-Received: by 2002:ac2:5b87:0:b0:5a8:8863:a581 with SMTP id
 2adb3069b0e04-5aa3237d7f3mr3797823e87.15.1779767342128; Mon, 25 May 2026
 20:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260525053016.169150-1-qiwenjie@xiaomi.com>
 <6a5068fe-b62b-4f43-b0ae-ab1c7f70e078@kernel.org>
In-Reply-To: <6a5068fe-b62b-4f43-b0ae-ab1c7f70e078@kernel.org>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Tue, 26 May 2026 11:48:51 +0800
X-Gm-Features: AVHnY4Lzm6GTtAZ-pUNrXV_cBzCNBWieYc9KfGAbwY1ijZ7M2Fk-OUllcweptZ4
Message-ID: <CAGFpFsTo4EG1kqvONt3F=+aZ0bZn4vbuh=8DO4PLZACJ6AVq2A@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Agreed, v1 can wake cp_wait before nr_pages[F2FS_WB_CP_DATA]
 reaches zero, so the waiter may recheck the counter, still see a non-zero
 value, and sleep until DEFAULT_SCHEDULE_TIMEOUT. I sent v2 to address this:
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 1.0 FORGED_GMAIL_RCVD 'From' gmail.com does not match 'Received' headers
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.46 listed in wl.mailspike.net]
X-Headers-End: 1wRin3-0007Dq-M2
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid cp_wait use-after-free in
 f2fs_write_end_io()
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
Cc: geoo115@gmail.com, yangyongpeng@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, qiwenjie@xiaomi.com,
 jaegeuk@kernel.org, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:geoo115@gmail.com,m:yangyongpeng@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,m:jaegeuk@kernel.org,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,xiaomi.com,vger.kernel.org,lists.sourceforge.net,kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B566F5D0763
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  Agreed, v1 can wake cp_wait before nr_pages[F2FS_WB_CP_DATA] reaches
zero, so
  the waiter may recheck the counter, still see a non-zero value, and
sleep until
  DEFAULT_SCHEDULE_TIMEOUT.

  I sent v2 to address this:
  https://lore.kernel.org/r/20260526034439.1017521-1-qiwenjie@xiaomi.com

  In v2, I used atomic_dec_and_lock_irqsave() for the F2FS_WB_CP_DATA zero
  transition and wake waiters while holding cp_wait.lock.
f2fs_wait_on_all_pages()
  also prepares the wait entry and rechecks get_pages() under the same
lock before
  sleeping.

  This should avoid the missed wakeup you pointed out, while also avoiding an
  unprotected post-zero access to sbi->cp_wait in f2fs_write_end_io().


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
