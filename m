Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5316B5757C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Sep 2025 12:05:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z9cK+uR3aryt0q9tfv0mpBDGgabsTJtg38u5uIWj6fs=; b=YwIhf43bvIvIMpazGtjce155aQ
	sOty+pCmVpzs42fJTrZlJK9BoLCTAL4L5QjowznKh9GnjJFFqM862wvuGNrAzgi/kEeY9Z8sux4k9
	YybP++4fhBTkrITAdvBLf3/eiFDtNeB+Ig6e4IbDmakdywHhkyrzGZh+1CZbgv5Zhnb8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uy65A-0000gD-2W;
	Mon, 15 Sep 2025 10:05:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3yuTHaAwKAAEkqsvtblpxtljhpphmf.dpn@flex--jprusakowski.bounces.google.com>)
 id 1uy658-0000g5-Iv for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Sep 2025 10:05:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DvfUW+7ZBYUS2Y3if1wlcE68XU5a59WQYlTWSUQ9KYU=; b=Tf8dyioDzBtdaiCXlOy+4pKzNr
 TrxCBEKoNnvQsnqW6nNS3/kw8nsWwoemrrxj0sd0Vsw8+9c+Pus4kJnBrYYe1//F9twxxVv/tKo52
 1GWq2BD1hWZJe2uHJ++Dg7OeIwJ2+V+h9eaTkiDnHRa+Zvnrgk0mEQ4euENry3r14OEQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DvfUW+7ZBYUS2Y3if1wlcE68XU5a59WQYlTWSUQ9KYU=; b=h
 ciDvrdGBLr2Fe4rGN4xZXqWn2pxSUPkCCY770r5559R+2dC1iPqzebk3VhYSzPICCmAZf4ro6IGi0
 Kbl3lA+bTOaOT91ltTWYjV3YxkIPoJs2FDxKaza4ivVG4yaNFYuPbWmzt1kt3IYt2C8esGrdJAjW1
 1iLiPz9FvEx2rO88=;
Received: from mail-ed1-f73.google.com ([209.85.208.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uy658-00070D-7v for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Sep 2025 10:05:10 +0000
Received: by mail-ed1-f73.google.com with SMTP id
 4fb4d7f45d1cf-62f2cb465f8so1198774a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Sep 2025 03:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757930699; x=1758535499;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DvfUW+7ZBYUS2Y3if1wlcE68XU5a59WQYlTWSUQ9KYU=;
 b=b6g5+W/ntZwu4Zn5zmcY+DVeIxEa9QgeyjzE9yip23M+KhPeUC8eFEe0Ad54xDcA1k
 t4isEIZ5B96dFCBfObXxfw35k/zw8AY8fjNy06yZWm57aJZx2/O6CZIazV/XxwIM7ADx
 t9BUa1OAlXap39bw1vjAFOVc+3K7KV6EOP0iD8MMmEz5dIJ8QTRfKWyLIaJtLJiCLduh
 LsZB+4Pc0akYuQVg1QocIvrDHPO913U2aTBq1pggzNEvgnHarN9XB0mBZKSLEXa8xbbU
 nqJOLW+ww9H0h+bV5qoQS4iihxjOR/v9ld3bEo0AklfrvAsM7D1IVQpXaUz2OAf0PGfu
 7xUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757930699; x=1758535499;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DvfUW+7ZBYUS2Y3if1wlcE68XU5a59WQYlTWSUQ9KYU=;
 b=CewnYh6P1Jj33ViVuWtmLGzIAzuVJloLg3d5MOe31d51c8J+3dgwgXVlAajojByfQD
 LoplZg2wavyhOxlFG8ZNAUj64vOnpXQs7vhyC439/NHD/G96nBoyRpFaycXRi/d/Dq4m
 RNfyhzkKcMmh8yTvFrHPuMKJIxtaPHkDZFwpYqWjESE8SwLuzrnX6Lwv9OlqHNCVZ75B
 Dyy9hkf23AZO3I3rQQButkJPw93aWsq2Ydczs9stjWb5f8o6NMsQEbghu1W/0pcbbXIS
 DMb6ioip8MVivlZJ3O17wPTwb9kB1vaVfpg6eNLYiLdxAAQsEXD6MO4LMpLuX0xBo6z/
 UMBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWtTxIZnifKFr90XDzdJ6TbxXd2yqnnym1xtcnAMkRXJmtfgUJQKrLSdniMcLCOMb5KSe1SSBhcJZdTEypBAAy@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyJhpWK4aZAmJEdjkabyErOn4pgAi6ZG20XeyVR0WB07Cf4LeQU
 Lsh4f/xl/9IrYW+ppJdCTMyYhoXLDsnKhj6LHw2xvIPCER7yg+oy3A4E2QI1ynT79506I48U2X7
 1bAyklnBfFn15ir4a9kqWw9zgmQ9ESg==
X-Google-Smtp-Source: AGHT+IFFtovcE+hpCdmo0WK6KIxOmWxwnFMcROyx7lU+m1pPt7HBZEJ6WYvb3h1UGWc888U5BmO9y2Fh9j56p74N860=
X-Received: from edaa19.prod.google.com ([2002:a05:6402:24d3:b0:62f:5354:86ae])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:278f:b0:62f:26f8:fea0 with SMTP id
 4fb4d7f45d1cf-62f26f91103mr4556197a12.33.1757930698573; 
 Mon, 15 Sep 2025 03:04:58 -0700 (PDT)
Date: Mon, 15 Sep 2025 12:04:50 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250915100451.810719-1-jprusakowski@google.com>
To: Zorro Lang <zlang@kernel.org>, Chao Yu <chao@kernel.org>,
 fstests@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Changes in v2: (Thanks to Eric for the review) - Instead of
 disabling the test entirely when file compression is used we now ensure that
 compression of the test file is disabled. Jan Prusakowski (1): common/encrypt:
 Do not run _verify_ciphertext_for_encryption_policy on compressed FS 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.73 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uy658-00070D-7v
Subject: [f2fs-dev] [PATCH v2 0/1] Do not run
 _verify_ciphertext_for_encryption_policy on compressed FS
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
From: Jan Prusakowski via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jan Prusakowski <jprusakowski@google.com>
Cc: jaegeuk@kernel.org, Eric Biggers <ebiggers@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Changes in v2: (Thanks to Eric for the review)
- Instead of disabling the test entirely when file compression is used
  we now ensure that compression of the test file is disabled.

Jan Prusakowski (1):
  common/encrypt: Do not run _verify_ciphertext_for_encryption_policy on
    compressed FS

 common/encrypt | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.51.0.384.g4c02a37b29-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
