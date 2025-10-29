Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7681C19883
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Oct 2025 10:58:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ph6p/nOy36Uliv8FU8xFnMPTWt0nPDwgr4lkSHgdw4I=; b=cD8cpz1zfpEAKSnoGiRDMuJRfy
	dMu1X2XOwcOF+dihDe6lQbRjLNlnO90y72DzgTPnYD3ZNJBS44QE0bjSzb7VCO4A30O0gLl2qRvJP
	Gm2tL5F2Nrc5jo0TlxOqiM9wM8hAnJ6eNLlSjgcINlbKpsEtWF9dYP6HWe9BHxwukaOY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vE2wo-00042p-Po;
	Wed, 29 Oct 2025 09:58:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3zt8BaQsKAOMOTFSSJHMNJSLTTLQJ.HTR@flex--joannechien.bounces.google.com>)
 id 1vE2wm-00042Y-Fr for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 09:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TG7hKlVVldxlYKW/0fbCkRJaaVtKZa4iA2igZCm5fjo=; b=XykN+RdSDFHWUK1vdaAFmgXem0
 tPigjmEFJWDs7tsVqoFKm7a8+UgB1aRg10Tp4kB4VXxNdvssIhEuznO+fgq98WpX2j/4sJnFXkR0K
 QmWKe7XKeGA3MlOLe/z1l48ZAWWpQyn9kDkOpCTqvPNMEM7S/6A8pyELldHHIRBQQdqY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TG7hKlVVldxlYKW/0fbCkRJaaVtKZa4iA2igZCm5fjo=; b=K
 GmcOM6jsS0gnUE/3x3K31c1cws+neaI5Biuin6OKok0fQpcFFazghaNoxKF1yIsRfBpl0OANsggz8
 cISUoMTRajqPavSypB6dV0t3SOw+GOxf5GTB62wqCl8Qo5lFMc+51OpAgGxK/ThB9Qkxft7Exis8W
 AQ93Z3eDtdMIyZ6s=;
Received: from mail-oi1-f201.google.com ([209.85.167.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vE2wm-0001Xg-T5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 09:58:29 +0000
Received: by mail-oi1-f201.google.com with SMTP id
 5614622812f47-44da774cbecso8853418b6e.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Oct 2025 02:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1761731898; x=1762336698;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TG7hKlVVldxlYKW/0fbCkRJaaVtKZa4iA2igZCm5fjo=;
 b=OOI/sAVKd306ga5iJFI67CxssPnOjm8hbgH9IkuBKCQURmb6fQotTSIfEIV1BmU6Ba
 1GshR2iaJBlzqZw5ewocHTXBABBLX3QMhhyk5kF6+uYfg4qfCcX2Y7RP8KvCsugMV3W1
 ogs0D6MkigkCyfy/1wylBwOYut2GjHQNf80Zqeq0vUQoIsmdAf/84rW5GSSWPZYjSe1i
 ZtG18kSi09fkeJ+/2nbiMZMgOAzaRpQ4uExIRsJx3sry1nEkgqvDULaTUUFx/tpM7Wh+
 lzizdE0ywscfd1EpSA+bTqRzC540iGFS6pcXK9zg9EUzSL4QBQD0yClWq7884dlTaY4/
 DQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761731898; x=1762336698;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TG7hKlVVldxlYKW/0fbCkRJaaVtKZa4iA2igZCm5fjo=;
 b=OaD57le0i6x7F7kOvEvD3MvUDlp+iuPdz4G3EjerB5sHhR3Me6OgM3iZG+HZIBgnYd
 WbfqhnL40g92HNFU4VlucYTRO+E5MikclQB0zPXnqE1bP6F7MSuyjmmmIYYeVQKLLcWn
 DwqCw3Qv+JxVtkqA3vzfyCm6rPLkCsHAeNQFdDVbFnjT4acDlvgFnMNx0d35RVWDJd2e
 /yMYNbw90Ju/586xxnEfS4dsc1cA2xxrL5fb6Y+PzDVwLURI/dSVLmvjhTVGJU+xTC7O
 lYe7NDeMQR+Qhjw9exvBajpUHme/Td5Mrsy03tRbwO5PjcdDWBqL7zL/ul4/rBq5rtoJ
 FEkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe3G3S1vhgVH4CjTXLgVK7qgpDGxgDkfKBYfvIsNnqeKlMwewHqjvY1+fDgYSfRiNeyU/8N7Ww+PA3wwQBZJcF@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzHzvCLNYpce2Wn94K6rnOYKEkrUbE3w6OxZI5cUuoOpdoqUbyO
 yZD+pC9KPZ6kWWYJs2PuaYd8/M10mEiyP826xhRGm4Ym7GpiV5UezLzS0FNViOUDKLbXHTCW8SM
 bncmpyQRTh+UtdBvb4DWwz55vjw==
X-Google-Smtp-Source: AGHT+IHR8YkI7WIhmnwbsdBqu8NfFmfXLDaTUM4XSvRgD3OsxYZdVP7ypYFRVuhN2SG9DLeF+gErD7zEhckJvL/uIw==
X-Received: from pjbcp12.prod.google.com ([2002:a17:90a:fb8c:b0:339:ee99:5e9b])
 (user=joannechien job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:498c:b0:340:299e:dbc with SMTP id
 98e67ed59e1d1-3403a265483mr2712365a91.16.1761730510939; 
 Wed, 29 Oct 2025 02:35:10 -0700 (PDT)
Date: Wed, 29 Oct 2025 09:34:57 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251029093457.183578-1-joannechien@google.com>
To: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently,
 the created files are filled with 0. When filesystem
 level compression is used, they take up much less space than expected. So
 the final fallocate does not show an error. The created files are filled
 by /dev/urandom instead to ensure they are not compressed. This way the files
 take up the same space whether compression is used or not. 
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
 [209.85.167.201 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1vE2wm-0001Xg-T5
Subject: [f2fs-dev] [PATCH v1] f2fs/011: use random data to avoid file
 compression
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
Cc: Joanne Chang <joannechien@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently, the created files are filled with 0. When filesystem level
compression is used, they take up much less space than expected. So
the final fallocate does not show an error.

The created files are filled by /dev/urandom instead to ensure they
are not compressed. This way the files take up the same space whether
compression is used or not.

Signed-off-by: Joanne Chang <joannechien@google.com>
---
 tests/f2fs/011 | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/f2fs/011 b/tests/f2fs/011
index c21cb586..75679b36 100755
--- a/tests/f2fs/011
+++ b/tests/f2fs/011
@@ -35,8 +35,9 @@ _scratch_mount -o checkpoint=disable:10%
 pinfile=$SCRATCH_MNT/file
 
 # simulate fragment status in f2fs
-for ((i=0;i<256;i++)) do
-	$XFS_IO_PROG -f -c "pwrite 0 1m" $SCRATCH_MNT/$i >>$seqres.full
+dd if=/dev/urandom of=$SCRATCH_MNT/0 bs=1M count=1 2> /dev/null
+for ((i=1;i<256;i++)) do
+	cp $SCRATCH_MNT/0 $SCRATCH_MNT/$i
 done
 sync
 
-- 
2.51.1.851.g4ebd6896fd-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
