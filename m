Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C5922732C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jul 2020 01:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=24s90zr7MviMcOqhuB2jz+eZRgDLbcL+SHRmFXdCJ4E=; b=EwRDMzT2e70/x20tgueSx1VvK
	/3P9f4pev6S788+BscuayIpyj9BE1QtSTg0EWQgjm7uutosRmix0FUUuA3cfWOucafq5qgSFdpvHo
	JDu50ofEomRZeshJZziWc493+0IGJAUq55LUkapqOr0Uqytua7LW0qBbjOULtd7Je6iFA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxfMF-0005rv-NS; Mon, 20 Jul 2020 23:38:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <30CoWXwYKAH0tbuzbuhpphmf.dpn@flex--satyat.bounces.google.com>)
 id 1jxfME-0005rp-PL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 23:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tw1KSRy/RGzW6ODk14gxzXMD1U63GyiUElKhvIibFKY=; b=VWOJ0JEyOcoIwqjhbV5HScKV+
 y16XeAJa9rDdSAAKsbvzdql9hDnVD/fc1+NLx/k+DnEMWTrk6IdXdGbaMtB83QlKlUb3jPiL/oQ70
 tCH9LldwUUVqZlHxxiKcXa024ct/LjPgnzxtDB84gBTWpb3D9wEHBCeZskSl1+2Qpe75k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tw1KSRy/RGzW6ODk14gxzXMD1U63GyiUElKhvIibFKY=; b=GTOv9hVauTEwGylU51yf33LzI/
 qX8l1h//GG9lQvZbOUnqduXC2PdFZ9FdoWV8h32o7yNPax6txE9SCqoYzC4AGrP0x4jkb5W3LT6AU
 KUVDM1texH2mGQfTbeepncHeTtEtaxdFxO53tjKuLSOWRAuL2gqFDhY1iQNJIPkxuISE=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jxfMD-00BOnn-Ji
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 23:38:06 +0000
Received: by mail-yb1-f202.google.com with SMTP id w35so23647833ybi.16
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Jul 2020 16:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=tw1KSRy/RGzW6ODk14gxzXMD1U63GyiUElKhvIibFKY=;
 b=k8+Ro/5x2Ds8e0bES/Bb+gDgCsnAADAIatjX0/1CBooykk5yihxlBcIPwIcH6hmIYe
 LXgaXg/vkkL9UXUHnDN0Z16DVY30zb2O41Pj/zsIcvsEDFvUeh5T3DucRY+6nxj01rVB
 SppvAXKyX1R0ewJnMIzP2HjuGgOd8T6KlcKrlcqZ+zdIBP210H86tZep7DVnjl24c1Be
 V9iOt9olg4hyXctpV5dJKKGEllcPDEJN+83bpBc2oIzIjScqOJDN7uFyJWR9k5QzLhMA
 g3CYGpZ6o3eNDf0h80e0YqabZFQXqa3RFVY12xkp7VFhtkZqBpKwU6Rsh4Lo+tyYM4tZ
 XTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=tw1KSRy/RGzW6ODk14gxzXMD1U63GyiUElKhvIibFKY=;
 b=iqsJK0MsncJd3t0+RhSAiKcMfZJchyoWLBI/SoWtkTK2Rfs13H6Sc9gOKn31IPFaE5
 gAWiRbV0gP7XxBrLo8gDW35J2Qk4B6ufDZEsJGbABRFb0Up/0NPdyyhNgYCbzRoxulfU
 5JDZsf+Krm3NwX0dvXWrkxknN7i8JT2sInu7TpM9PkyRRX/AStcbEKYbjgttM0JrJFJn
 iuajZnvXqupSQxaE4cwf1vx7KWwAahKFZwdxV4FxALp7DYO8Dl9heLOD7LTQ+JORZuIR
 vui79Zh3hpAR7zideOMjD12usqs7L1OQNfkd5RilyUlQCpH0Q77+hSN0/eQdo8q7YLUf
 kZSg==
X-Gm-Message-State: AOAM530LMEib8b2mpUbQ8iEIlBEp/adwq9nikyXB0koPoQDsU1liwmh4
 JjzRu4e2kPaVx0cKT3LhYMYr+x+Qapc=
X-Google-Smtp-Source: ABdhPJw+XaXhCgjy+lOT4XpcM5uskSX8btKU0m8htXqEOpWpD4vQYl5qgyAWPDG6ZgX/qqO1zLNrxVOOFRs=
X-Received: by 2002:a25:698a:: with SMTP id
 e132mr39855737ybc.177.1595288272542; 
 Mon, 20 Jul 2020 16:37:52 -0700 (PDT)
Date: Mon, 20 Jul 2020 23:37:38 +0000
In-Reply-To: <20200720233739.824943-1-satyat@google.com>
Message-Id: <20200720233739.824943-7-satyat@google.com>
Mime-Version: 1.0
References: <20200720233739.824943-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.2 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxfMD-00BOnn-Ji
Subject: [f2fs-dev] [PATCH v4 6/7] fscrypt: document inline encryption
 support
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-xfs@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
 Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Update the fscrypt documentation file for inline encryption support.

Signed-off-by: Satya Tangirala <satyat@google.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fscrypt.rst | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index f5d8b0303ddf..ec81598477fc 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -1204,6 +1204,18 @@ buffer.  Some filesystems, such as UBIFS, already use temporary
 buffers regardless of encryption.  Other filesystems, such as ext4 and
 F2FS, have to allocate bounce pages specially for encryption.
 
+Fscrypt is also able to use inline encryption hardware instead of the
+kernel crypto API for en/decryption of file contents.  When possible,
+and if directed to do so (by specifying the 'inlinecrypt' mount option
+for an ext4/F2FS filesystem), it adds encryption contexts to bios and
+uses blk-crypto to perform the en/decryption instead of making use of
+the above read/write path changes.  Of course, even if directed to
+make use of inline encryption, fscrypt will only be able to do so if
+either hardware inline encryption support is available for the
+selected encryption algorithm or CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK
+is selected.  If neither is the case, fscrypt will fall back to using
+the above mentioned read/write path changes for en/decryption.
+
 Filename hashing and encoding
 -----------------------------
 
@@ -1250,7 +1262,9 @@ Tests
 
 To test fscrypt, use xfstests, which is Linux's de facto standard
 filesystem test suite.  First, run all the tests in the "encrypt"
-group on the relevant filesystem(s).  For example, to test ext4 and
+group on the relevant filesystem(s).  One can also run the tests
+with the 'inlinecrypt' mount option to test the implementation for
+inline encryption support.  For example, to test ext4 and
 f2fs encryption using `kvm-xfstests
 <https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-quickstart.md>`_::
 
-- 
2.28.0.rc0.105.gf9edc3c819-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
