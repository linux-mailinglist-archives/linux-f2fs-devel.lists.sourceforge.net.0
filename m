Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF39BB06446
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jul 2025 18:24:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKqewNZ7t07rdeLKKt0QoGBxvePMyNf9BjrdDTH0kVE=; b=gTlNAqMumfLuUz5lOgZD3ynF/W
	uLoLIUkMERuDXjIDmupXc+3jB8hoicWNuc/9OwohbuxxFKyyRxPM6KEK4c1AVncG/jCFh8i1hZ0gZ
	qfKeHYiGwVSUqrut2NfXd+1mGZTsYCcvVbbL389EOJJFv7q0m6uOA/PhQNuvmLYluG58=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubiS9-0007rE-0R;
	Tue, 15 Jul 2025 16:24:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <axboe@kernel.dk>) id 1ubiS7-0007r5-Am
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 16:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NxDCw3B8lz63zePAllCoEi8/Bv/yU3K9Rjnfd8keF3w=; b=K87VSX1sBinNY84Yqbc3YNC44u
 g8Mi+05ZV/tDrELTI++wTJYCHdzWwcCHSLEoKtDd/ofH4toOVKSAaCYxA39ASZU/GOSMW5239KHcQ
 yqJz/6ZR8O/jL4wMaqt1MMohywy0uPyFLdBdSpmzfmnwn8p939alvfh3/J5yjUQsTd2k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NxDCw3B8lz63zePAllCoEi8/Bv/yU3K9Rjnfd8keF3w=; b=kOBee0n54otw1huCXxEmQG86lB
 8N9gT8ldhxk2BsVJs3dM8G3xwfEBcpKLkA9LQBBMrnp+KDxFxtrZMpWEJMOwKnb9C0ikiu8S57YVO
 +zV+oBjYMPsWwudOMSVRfycO13VqapFD8mUIQIsiqHax6ueocdK4RTcuI80335sXfC7M=;
Received: from mail-qt1-f171.google.com ([209.85.160.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ubiS6-0000rU-JU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 16:24:23 +0000
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4ab5e2ae630so31069091cf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Jul 2025 09:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1752596656; x=1753201456;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NxDCw3B8lz63zePAllCoEi8/Bv/yU3K9Rjnfd8keF3w=;
 b=bO7jbJIFy6mmDtXWxF3yJj1mbA+I6VidrUIhIKwGN2pA75L+pmpij+2NHv/1qO2YhA
 mI78DoOBw9omwJVXvKhspNAj2MeJ41OifvkmuOyYqLoV+wDaYJAlXMnSxD6ncxQAjypK
 t1nzRrChk95z93Yni0Qn5d1bPRSQa2TsrvMvfNMe5jukLNG16CKsnjsaBdzxQ1VsmBwf
 paybe55f48LMErg0jN4XCaEgNa8agT4lZqKtAq27HDuvhTFXgJFrky6u5RNkqUfhVSm8
 Hg0SsftkXicolsb613j/sIU7DqCRBFwY3PiN6/QWwI/mW7cJgc2GKUdLsC1Q2A8iZUu1
 DSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752596656; x=1753201456;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NxDCw3B8lz63zePAllCoEi8/Bv/yU3K9Rjnfd8keF3w=;
 b=fNAvpkcOGDdTPn1g2Kl5c87JSfVKw16uM3YGOCdQhbez75PHiRokLm6k+eABbtNbH5
 BE4wofihNl61VmfbjYp+zUJLZWGYbi4B9dAqB5TOIwRf/p3KVcL0ZEtdPOsiy2/KPtRf
 AmV/7TnmT3e1tRIkHm62qjYs1xbs1ksKBIJ9DHMy5t/WdAiYTfy7wd5+R+zpDI84T1bV
 w++LEL22Vt2+xiAhty7FwEoTguQdBItryPauH/4Cg0qH+TmasB7FfGF+9aKV22cd657g
 j9vLBQb1mbbR6Xvh59uttn7hfCor5N2PRk9RQf1Qsv8abztkKLpD7IbeRZJADvTHZ9tY
 qFUw==
X-Gm-Message-State: AOJu0Yxp4W6f4dITkCbJyMyh4MY4pSCGTM4fkLtS4ndXuvAEz8blHk+1
 jcM7WS8f8zY8dwcrf+hBeuSz+itSllgwSZjveOxc8Hx4wTWgvWg+KPt0UGFDgkJ1+e4jKKkGNrY
 iT9DS
X-Gm-Gg: ASbGncu4v5Z/nN6yhUHaQr/bq6yOVJkQZm2jC8v+6knHhDX4KZMby1j8Y7CDM7kplCL
 p9y0pHKTie9YULBEkgChXaEmj6DI89KPfPmgfU3LlSzWAx99IAy8OmyZMP5IxCNq5JIQ1lvmmtb
 Tvrnox9FMyI8REeRNUxc1Z5oMYHfVn4LgnOaHWQGnkmTrMSV5LBrBrlAeKWGoxdMimBl0i7I4KW
 mPn0Cb6eo7LOq9dkgoFCpRXrxRFp1sfzgOsmAOdKU6Y/jDNLlx/05hj00660vNOtwSrbC4+OR/L
 iubJGinDUnPGsZuc1W3z2gRjm9g1dUWSzKnJeZF8WHFHvvPLj48eiiBu/KRWRJnLudxS3fMZi0E
 iAq805Zjnl4+IXMDdWeg=
X-Google-Smtp-Source: AGHT+IEX6DIBAok3abjxzf+yKdxGJWKxkOF53iju/PmUm/+4tk/eITPCBnbl9TA99RmWF6UUCIqzjw==
X-Received: by 2002:a05:6e02:1c0c:b0:3df:3271:6aba with SMTP id
 e9e14a558f8ab-3e254327ac0mr149854285ab.15.1752589718545; 
 Tue, 15 Jul 2025 07:28:38 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5055697326asm2598255173.76.2025.07.15.07.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 07:28:38 -0700 (PDT)
Message-ID: <056e083b-8e41-45a2-9b0f-2ec47d1a9f71@kernel.dk>
Date: Tue, 15 Jul 2025 08:28:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qi Han <hanqi@vivo.com>, jaegeuk@kernel.org, chao@kernel.org
References: <20250715031054.14404-1-hanqi@vivo.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250715031054.14404-1-hanqi@vivo.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/14/25 9:10 PM,
 Qi Han wrote: > Jens has already completed
 the development of uncached buffered I/O > in git [1], and in f2fs, the feature
 can be enabled simply by setting > the FOP_DONTCACHE flag [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.171 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ubiS6-0000rU-JU
Subject: Re: [f2fs-dev] [PATCH] f2fs: f2fs supports uncached buffered I/O
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/14/25 9:10 PM, Qi Han wrote:
> Jens has already completed the development of uncached buffered I/O
> in git [1], and in f2fs, the feature can be enabled simply by setting
> the FOP_DONTCACHE flag in f2fs_file_operations.

You need to ensure that for any DONTCACHE IO that the completion is
routed via non-irq context, if applicable. I didn't verify that this is
the case for f2fs. Generally you can deduce this as well through
testing, I'd say the following cases would be interesting to test:

1) Normal DONTCACHE buffered read
2) Overwrite DONTCACHE buffered write
3) Append DONTCACHE buffered write

Test those with DEBUG_ATOMIC_SLEEP set in your config, and it that
doesn't complain, that's a great start.

For the above test cases as well, verify that page cache doesn't grow as
IO is performed. A bit is fine for things like meta data, but generally
you want to see it remain basically flat in terms of page cache usage.

Maybe this is all fine, like I said I didn't verify. Just mentioning it
for completeness sake.

-- 
Jens Axboe


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
