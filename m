Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F80CAE15F6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Jun 2025 10:29:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZM9+bokTBmKx9TtMHZLhWCbo56TYhZyymyRHah3TYqQ=; b=JsPvqm4YFg8qfXAmEhyPQC8sWb
	i86X1cEB45Lm2+8K7+K7s152Nw0v0k5nFlXqJDItm8yrOhVcdKY4QwYiby5jfM20a/kIDXeIVFr7V
	+kPbb1RzPDV61P78U306m4VeusX+kIIlF4Rhq9Bt0Aw7/unCqtyJ48jkPPJBBeH5mlmE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uSX7r-00080c-3b;
	Fri, 20 Jun 2025 08:29:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <33RtVaAwKALIbhjmkScgokcaYggYdW.Uge@flex--jprusakowski.bounces.google.com>)
 id 1uSX7p-00080M-Bg for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jun 2025 08:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UaCdObgSH6WxlhEDS7jc2D5S2sYItdP4GSFStF8K+oc=; b=b2mskPq6TZHyVpHPCO7aW6/kKX
 OWoaAzynVU2G7iKQpQTmTi+ivFiI0qm8VXh3LF7G0L4WFwkKWuLs4vVav+0szTLs4x2thTEG64LZk
 iS026JZHGUfOq9ndH1arw9VwGAxKOHRjZHqr/zO8D7Mn356NpYXLJajOr2Xe2UjAgCUw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UaCdObgSH6WxlhEDS7jc2D5S2sYItdP4GSFStF8K+oc=; b=S
 qPValD8CyEM2L4w2OUhCBk1jpxaXw1SXpOQPDVgs8Jlz4tmYxOc0fYACJ6nFq+Kq8btceZe7d5FIk
 1Voc2Q+DehC7gicpguRm0CcQD/wzySrXL/zY17l00IRvvpHaftRa4ci8P9UmvBifNAx9d2fJ9mEh4
 BQCJQKtejJEkZE4k=;
Received: from mail-ej1-f74.google.com ([209.85.218.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uSX7p-0005JU-1t for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jun 2025 08:29:29 +0000
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-ade5b98537dso168677666b.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 Jun 2025 01:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750408157; x=1751012957;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UaCdObgSH6WxlhEDS7jc2D5S2sYItdP4GSFStF8K+oc=;
 b=I0ydpZLt1ruSdHNfiIaTuT3VQxwrBCtDxky43aFgh3v8CjY5FO9WviF+JptOjMl3/H
 NZvtA0LyC4wb7flTktMiDRF0PpdLy0uW6Bw8LTtfrj+j1JoTlbU2vcZtUy1HCILOSvH1
 nGbKfU3LAfhBROWAL9uVKjbtJl8h6G0KzwlIq4rd/AL2GinduISilOwnfV8RYwTHbDi/
 S9vWBQzF+Zg/Uf7obDVji3OpaIcvOgmfB9coiGidgfhGwdMhrDeDjyrvXi5cbYAGLWRw
 KwF7SacDYKCFr2NCoFFTgBB5Gq9EmlpG1GG/DuwIW0Y4kgdvLApxrcSatjg5Sg0zFkg3
 ykgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750408157; x=1751012957;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UaCdObgSH6WxlhEDS7jc2D5S2sYItdP4GSFStF8K+oc=;
 b=U87+mKAc3u6b6asi9l1/DIsZXckTZPnf+X+zV+JaEIMW9iCxi6K6EQh5aQZWoUmfqS
 iO+M3LgVCPsn/Tkkw03pE9QjlIrM7FcbNx+HqUFJzUjG0Ps8g/kwa3UAOQXXF3AnsICR
 Iv4R5IJuBjIJx6Tejbm+EgOXYLjQEByYyzXSoys9zB1J2I1Tm5NfZeraHfBERv+UvopO
 hHFv6Dl1mlATBfELxp6vdlxc0Rkd9ApUwTMl76/UlX0s7maDEVqKNsrGyQiPUnPDj5J7
 T2vRVyuDNiDavGw0gmc5YZaK+SHxqhaIyOaFEu8jiHZLL1p/WEBFVKFQVmLG9s061yZR
 v6sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeiP6/1ANjoFYTOQuI3TGKAKC4Y24fZD7c5MZDZ8tpk3TpvwdQMmF8P+dUfcN/f1Yc+i3Qt9Iv/Z3YXlqxJ1Q3@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy9qbg/zl0N2fei1VneVKt9YCvCXasHxDduDpYIb3t9vEWX4EYE
 J9z+V0Y6CwyMjHRFab8d/44YvxDJ8NL2pxSq5E7WD1LZXs0xxNvi6T5texZqZlaFg35nqNcaIoG
 p/JzsAdVVSYz2DeI9WOpNK9ZGgVFzjg==
X-Google-Smtp-Source: AGHT+IEA/m7L+UmZdOFrJWXH2xK6bnxzXkBEmJIcQUnEt9BcKM3MHaSoEO21ixMJDykHp1KjQ3nsAEwApbDiH40LTTc=
X-Received: from edik12.prod.google.com ([2002:a50:cb8c:0:b0:608:ab44:efff])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:ae47:b0:ae0:3391:f068 with SMTP id
 a640c23a62f3a-ae057d4eb0cmr136491766b.19.1750408157514; 
 Fri, 20 Jun 2025 01:29:17 -0700 (PDT)
Date: Fri, 20 Jun 2025 08:29:05 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250620082906.2122560-1-jprusakowski@google.com>
To: Zorro Lang <zlang@kernel.org>, Chao Yu <chao@kernel.org>,
 fstests@vger.kernel.org
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi,
 We're testing F2FS internally and when we use a compressed
 file system we see the test generic/018 fail consistently. It looks like
 this is due to fiemap not supporting compressed extents correctly: 
 Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.74 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uSX7p-0005JU-1t
Subject: [f2fs-dev] [PATCH v1 0/1] generic/018: do not run the test if a
 compressed filesystem is used
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
Cc: jaegeuk@kernel.org, Jan Prusakowski <jprusakowski@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

We're testing F2FS internally and when we use a compressed file system we
see the test generic/018 fail consistently. It looks like this is due to
fiemap not supporting compressed extents correctly:

    [...]
    defrag /vdc/fragfile.9981 in region[0, 40960]
    /vdc/fragfile.9981:
        0: [0..31]: 2682968..2682999
        1: [32..63]: 2682976..2683007
        2: [64..79]: 2682984..2682999
    Failed to adequately defragment file

We'd like to disable the test when the file system uses compression. Please
check the following patch.

Please let me know your thoughts on this.

Kind regards,
Jan


Jan Prusakowski (1):
  generic/018: do not run the test if a compressed filesystem is used

 tests/generic/018 | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.50.0.rc2.701.gf1e915cc24-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
