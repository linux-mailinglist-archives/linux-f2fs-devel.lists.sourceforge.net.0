Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6832A2D639E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Dec 2020 18:34:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1knPpp-0003eU-4C; Thu, 10 Dec 2020 17:34:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jordan@getseam.com>) id 1knPpG-0003d2-Am
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 17:33:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:References:Message-Id:Content-Transfer-Encoding:
 Cc:Date:In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HX00ljoYcBpwo620XpEoBM+0PsO7nSsR9V2ekXYfcnw=; b=Sp7nm2WFY3/4Af4Q+n1QockRCf
 GMCg8mFc6scseNUnD/iQd+ZtsnTu0wd1Ja570VafqQuW7dr1BggX4BBbRlnBOyL3IuEBMaCv2N0vN
 +g4j/QWnZnsY3pcAZJpmCE7A9Ddj987Dln00jS3cEQiVAxVBcxCLmsjCaZwGDevSMcyw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To:
 From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HX00ljoYcBpwo620XpEoBM+0PsO7nSsR9V2ekXYfcnw=; b=ljrSLbUj6cAoJylhoWPMLKf15I
 3SGTKbXe7bgqQV9lLia94JVCWgzfOILSJghIxMmsV/xZ24/8jpGFCHwCSSWo6Fe8d7z2nCYME1eoa
 L39JBCfxmLQ4zRbtAiSzr5IM6BTf3HlQkncmFJmIiIGeYRmDauhJPRhi9yV5vKGmxUfA=;
Received: from mail-io1-f42.google.com ([209.85.166.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1knPpB-006m68-63
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 17:33:58 +0000
Received: by mail-io1-f42.google.com with SMTP id n14so6328629iom.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Dec 2020 09:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=getseam-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=HX00ljoYcBpwo620XpEoBM+0PsO7nSsR9V2ekXYfcnw=;
 b=2MeC6jElwzsZiBlPnFkSy71mz2DnkUYHthfG1CLg1oMpj0An83ZRAtV5qbhCNFlnBv
 U0xCzMLBNXH19G0TQCctB+vAF9tb63rAReRGiq0Hqt/c+BQAxAqeyVyCLkfdVqPQ9Z0D
 qCq/FzarpTVRABrJuamWPCMC834QXAOITOS1uUH82uhVvhTnOI1mupMesUPrVnWwC1si
 PxeEv6ffNiLVB0vEnSjuDApjk37P282xjsVrywJOhrfN/vrb8mf/ryd97kSpjjnERTSt
 eUJwYWLshev5qdbtIGFIIV29lFjn7F3KHSk/EaTr2VUtZwpYyXBf5BkE2K71ldaDVwtR
 kSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=HX00ljoYcBpwo620XpEoBM+0PsO7nSsR9V2ekXYfcnw=;
 b=LuzKJqL8wf2+9UuPnhpMM91Yvf5J9YNxSBICUc6Sr7o8SRho31UU8XZimrR14h55bR
 cI0z267QZedxKVFaM63DQ/GgqANVt7jstJQHtHht8J6VTq1ojDINlorDpQUaeOZVy4pk
 O12WBY5nKnKuHcmwoCJL0vJjfKhMqwG89DABhH+gCbdZIKhq+ot3m0BIgX84jMYWWEBE
 rLiLjjwBHPZq6E79vd84ZveU3orTXzFPGk0oOth7I5UdzulF4kJ1MPjbPrE7L6UMNajA
 5P57CA4LrCLmshsTBvQGqHFVBeG0gn2qsT20M0ThYQxUPnfx/5s9Zx61nGhCwla3fdCk
 L2OA==
X-Gm-Message-State: AOAM531rbqO0QzBm/kH3/yWlDxz0MLnspARy84hneCcxXp6Gt3V/wlFb
 9G4GWozSFMcNVTuUSdf+PKdHQIOhKlWKmkvV
X-Google-Smtp-Source: ABdhPJykxvzmEkoPzdi+yZJT33Ke4QzrBhGlgzllLyVnypNAi8+fB73qjt3Y7OKBDASDUX20Fuhn5Q==
X-Received: by 2002:a6b:7a0a:: with SMTP id h10mr9291675iom.208.1607621627639; 
 Thu, 10 Dec 2020 09:33:47 -0800 (PST)
Received: from dorothy.webb.haus ([24.148.31.157])
 by smtp.gmail.com with ESMTPSA id w3sm3851563ilk.17.2020.12.10.09.33.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Dec 2020 09:33:46 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
From: Jordan Webb <jordan@getseam.com>
In-Reply-To: <X9JWj8lfBau57VV4@google.com>
Date: Thu, 10 Dec 2020 11:33:45 -0600
Message-Id: <E563A6FF-7E12-49B9-BC12-3BE11F4F0B99@getseam.com>
References: <D741743D-EAFA-4C26-ACC2-2066AF51DCD4@getseam.com>
 <X9JWj8lfBau57VV4@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Mailer: Apple Mail (2.3654.20.0.2.21)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.42 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.42 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1knPpB-006m68-63
Subject: Re: [f2fs-dev] [PATCH v2] f2fs-tools: Make sload.f2fs reproduce
 hard links
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> If you don't mind, can I apply this directly into your patch?

Looks good to me, please go ahead. Thanks!




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
