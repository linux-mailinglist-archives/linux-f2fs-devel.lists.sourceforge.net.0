Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NxQDEESvGnbrwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 16:12:01 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CFD2CD796
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 16:12:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51+0ad057a33K4n4HAZEGR/KmTLr5h8qrdAwsdN+80E=; b=i0iZU0CpRwzWA8jdcABTxdvnKx
	I9Wui2jc23MFgmzK61pqM8/flvzTF517LXIE/B817ZLir+lk8S9Jo6r9cZtvjakokAQWlBzRWPEpE
	wt4PncPqAgjZmYLZ9OtU4cecrB4DlM31870fqad8LdXSRbYrInzyPaB5Prq37kzXvqT0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w3F2J-0006sV-AD;
	Thu, 19 Mar 2026 15:11:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kth5965@gmail.com>) id 1w3F2I-0006sL-2P
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 15:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rE4TP5G0/Z2glX2Ff42zJUqrHwF5wIaTpC4CWB4qsxU=; b=ccYNWQOJPjWzHpfeciBYcE4uOB
 wBtl8Vikm0fZo2Jb8FYS56XD5CC5a9YA2GS0ob8vkyOMClky2iqi5pKlQx4pgFjt/vEj3XZNhVLeP
 A+oESVi6t8HZFDCxbBiAIWtIk5EVtAAk45Q4sF2RNQg0Mle5TvlDB5QuNCGFoI3msI9Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rE4TP5G0/Z2glX2Ff42zJUqrHwF5wIaTpC4CWB4qsxU=; b=HsuOkylZ7YLHMyYp/7tddQHelc
 agP8kaos8WPqryW7nV2yt3GNXTEECC03Y9rfe/rgd+NkCzasbn1cIjvm4ZbSC5cJWlQz1vJfmAhrF
 84+EJ0Iz8t37ds1EZswbnuffYvCgobVabRdCJhzqsw7wFXSfFMPIzeaLyenDqIJk6FR4=;
Received: from mail-pl1-f173.google.com ([209.85.214.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w3F2I-0008JA-AR for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 15:11:46 +0000
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2aae4d2d215so3683755ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Mar 2026 08:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773933101; x=1774537901; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rE4TP5G0/Z2glX2Ff42zJUqrHwF5wIaTpC4CWB4qsxU=;
 b=L6V9u+b5KQ+uUHzpkHtpKiek+zhEF+iIgLaRgJ5Hlfb/sNH7bCcbdP/cUIYKafoesZ
 gSg1JZ9Y49P1d1862bWmMP3kWyAeb6gEQ37PoFd0PiVfpfUVEAH+4QaS0SCEf5BFzS1Z
 NTSPGt/+V6+by/9Y25I+p2hmeuTIxtUSL7P+LZb0xSFWs8TdA0kpXfzzDXMkIbCMc3Ox
 ruWorAYMKVJkSFpN6YbbTK4eo4wcPRbwoeonO3EwOV+602dEhs2w5yyEV75ph1mySZmw
 ceREMCs50Dn3tABfgmEjAFOFSKTUuIRfZtpJnseHA2xkv7gQvbI7SKVVRBJn9fFvTAf5
 Pp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773933101; x=1774537901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rE4TP5G0/Z2glX2Ff42zJUqrHwF5wIaTpC4CWB4qsxU=;
 b=aLyOvJ7rj4flJjRDPFl5LAA42s9wwfoZtAYElsXUHxXsFEjoGtU8SIz/j0sBpFutjk
 h+LLYkLMIUZwitDY3H5BbOBsXOOls4FMnWCg0bMK3rtAMuKWfeivFgNcLNTiaEK3uAAs
 5ADW/PAXbYXOEm1tZOc6y8MEFIwpRb2TbOsZAx7d/Ks4WBICdiAWyRt0RPrN45cmxnIa
 Xx50+xTwQ8Nq9cSBGfP200Md0bOcECuVcwWg7ZwWCeeJyQu5wOAwYTxkS7Ztld2lU7ex
 cYm6fLWj74xIe2vRugTmQnxCrEWK2zwFUSxtZrNqnBowKK3whSV2ve6fhtQFFvlvd1LR
 8h2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgBMSSGkoLM1/ZiU7N0YeU1w+4neYLVG4dU9utcH0IyUbk/E73Ix/fP0GMaf5vXdxxgd6a9F82bGMKLSaO7TTE@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw476SB10+9rwB0yu+wMwHQhLjyyvHeM1uMCzm+Bia/h5dY0lu/
 0FUo4VpvS5i7Le9LeDDy8Vj1kBmg206jT6Hm1ncno26L8ACp0RLVUKDq
X-Gm-Gg: ATEYQzz1Orr27XOUFLJX2p78S0CUHsTHO+9VebOVLBhdcmFqnIPwExClVrFTG73mLmm
 H1+ar7ttBBHolWL0jAIfXdx9/+t2QkS/Xyz0Ens2fcmXgZbmLkVGsp5Rty/OVGFEs8viLwz4Qxt
 G+uep6BJYpjOwlRUozH+hk+y3iQmoo/Jj7wo235fPie4IZG8dgrU2Pt/Fbmev0e6OKAl5ho52g+
 D0kvsn3uBt9DlIliu+g22DLKQ7XR3q4pcj4757y4JUBtLM0EJic9Ospm4SmfhdotBYK0elceL76
 PNX320SPqYvZWJUltxjN1N1kJN5Hi74wvU7knc4t3B3ERLYhs/Zn8IZUIAlxc7CTzowGxppgIuA
 5dnKo8EMHwUAjoxaj9/UVeLiwvBLfPyyudPS9XZ19XTSEdt/Z/fdoe7g4o4Zcn4LFofDN1/Mvwo
 K2jOo1IB/HqiNBrPIHsLZmN2a1QrZikg==
X-Received: by 2002:a17:902:f54a:b0:2b0:4d92:b8c7 with SMTP id
 d9443c01a7336-2b06e3381f6mr50540845ad.1.1773933100495; 
 Thu, 19 Mar 2026 08:11:40 -0700 (PDT)
Received: from kt5965-NUC8i3BEH.. ([182.217.14.201])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b06e5ef58asm60221695ad.47.2026.03.19.08.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 08:11:40 -0700 (PDT)
From: kth5965@gmail.com
To: chao@kernel.org, jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 20 Mar 2026 00:11:21 +0900
Message-ID: <20260319151121.39737-1-kth5965@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b044d785-cf71-4186-b208-c375c605893b@kernel.org>
References: <b044d785-cf71-4186-b208-c375c605893b@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, Yes, I agree with your point. I also think 2) is
 useful to detect the corrupted inode earlier and to make the issue visible
 through log and returned error. 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [kth5965(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [kth5965(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w3F2I-0008JA-AR
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: evict: truncate page cache before
 clear_inode
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[kth5965@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:syzkaller-bugs@googlegroups.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[kth5965@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 46CFD2CD796
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Chao,

Yes, I agree with your point.

I also think 2) is useful to detect the corrupted inode earlier and to
make the issue visible through log and returned error.

But 2) alone does not seem sufficient, because we can still reach inode
cleanup later, and then `f2fs_evict_inode()` can still go through the
inline conversion path.

So it makes sense to me that we need both:

1. earlier detection / guarding in sanity check
2. fixing the empty inline conversion path so page #0 cache is not left
   behind

If this understanding is correct, I will prepare the fix in that
direction.

Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
