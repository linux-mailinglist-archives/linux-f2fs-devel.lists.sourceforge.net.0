Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 475B1AFC37F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 09:00:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:Message-ID:Date:Mime-Version:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ch90zgF8Z5IxrQNw+QW+Ak4b1cofFRAPWw+iDbVf4b8=; b=kQxRds1FnQndIcn54LPbLXFHXV
	TU0DlF4Xi/0ZM7IZBWtX5VsRa3UyX7ElC0hEmMZGBVpV0f9ORHKezUqS2neKUx9pkAscVKIlPA80z
	iGfp9NXo1i2F7BthXtIJjvw7LYzdEU9gtjOMKotGi+v8De/qA02gPTLJPgbMhHHBHhKo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZ2Iw-00011C-Pd;
	Tue, 08 Jul 2025 06:59:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ywen.chen@foxmail.com>) id 1uZ2I6-00010E-4K
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 06:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:Date:Content-Transfer-Encoding:
 Content-Type:Mime-Version:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OM6K+jZaBXAoTLY0N4NnW3rs077RdjL2OSQEQtpSYZc=; b=l/vTcQEfXxXAIr3vu3vQiqLa8V
 X0gRrgWISdOej1YRMsttaoOOZaBD3bZn1C2NziVO2tT2K6Dlm4tkCWl1dBm/rEs/E43+mGMsqJ8to
 OpfLt8SIK7YPC70HvsSd5NnozKo+7xgahIk6YqZiFtOH12w2IoU+6i2AUR1NAgk057nU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OM6K+jZaBXAoTLY0N4NnW3rs077RdjL2OSQEQtpSYZc=; b=O
 U6jRQzUKyJoPfub8pOPj8E7bYkGSNHVRINoxrdchqXbrEOhbiPejF7mxCoU6dnGIO4yM1KpSFRtmq
 DtUfk/7d7BjEANkIRWE9ul9MHnvkcJBxBg+AGzXHhkm7lhmSNOA5yIfdJGO+rk1dgNdzCgQKFqc6t
 U2E0mEVSAphJXpHo=;
Received: from out203-205-221-252.mail.qq.com ([203.205.221.252])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZ2I5-0007ez-Bx for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 06:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1751957925;
 bh=OM6K+jZaBXAoTLY0N4NnW3rs077RdjL2OSQEQtpSYZc=;
 h=From:To:Cc:Subject:Date;
 b=A28G1LjoZ3HwbAgyXYEvP5rNEuaFQZGqHOmhNsGNpGA2MvIqkYXL3+Yeo8vTaN1+T
 4hB9cZ5wul0OC/kjW5F+gmKoVMpQ7gVExHcYJzXYQhCltKQsfSu9P2jSEFA02Q71r9
 Dchj7N/pxnynDFj/dmMAjPYeuDKtnnwH/ga+AccE=
X-QQ-FEAT: 3C1WcPM5lQ4i+tGOZHPx80amo8TvG3to
X-QQ-SSF: 0000000000000010000000000000
X-QQ-SPAM: true
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-XMAILINFO: M4kijGgdg8XvD6nB9qq3P51A2cCWZU8jZqnGM52RIwpXp1g0uc2MbUDM5iQFuM
 5RTLQjQiV/ny1SMNK6BiXkkbwONwK4byfFEUARK0XYXRx4aUON8oSwOfzVSXR9sk+IEY7DAK1wevk
 ik4UzdFQrQdG+cRd3XzZ17I7tMPwMJ3ItGCE8tFguM6UB5W1EIOJvZIXtsSiJJba3LzLiVrPlqhnS
 +uuW0FiWmXgKQgVeiGO4OOxQij4erJvlfzDgfZHK1uMEHn4VYCjfkz+xCgQG3I41KMuPclqGg3uyd
 Y0P3AClqAjg3qEk12DGHKBUTaZr2ZCt4CJFNrEmPAWQEbjv+go51HUO8yGxt4e7Ezh1NF7sAAuFoK
 3WCWXuJj2poDKjBe5mHqvviGnZSVnqkfRK9D9hswqxk9vP0kDv4oA3EuuS2UNZB6/PUpceS4ZEGCK
 vhhNMy8QQTbjJIZ2Uwyws3aKu3VQxchJpEcOFh+ey68Hs2FC8Ueg1K1i3t2OfDe+TS0NtPrJW1ixb
 KNW26RYYr2mtTfAViOI8VV/g5T1DpJpVLpEgYIdgeg4eaiJI+NPeULdjo9wU1jscTJMDAYhyqqYvM
 fRyIRbQT8NFxRcpacleYPGI68v6pRTH1GULo9kKlCDEe40Ac3KgOZY8ssl9SYtXlt6e7iLzJyqbw3
 a4DJVjQLYq+6yImHIFikYkIAXFqoqlKdW0Nl/HCNprh84Lz2V8DQRunV/2K8EfvQO65OA0Lg7dtvh
 qYcYBdQIMfvld5PK2ed9zfIRa8OvT1R8YGWRY9/bGOydjVcH8nLc35dRYlxjmDyjfayGc8OsWGBAk
 fRmdmwonXrSlGEU0PFdngoIma4Z2oE0pNfof71n75llqVsWtX21y4awb+KJkGn0chpiC0kQQLZnGz
 7fXukotVuxcuubhYKpiEEOCiWzuQOVp76tZY52j0IviZK1VeeN/0qKnVVr9iZ1Ybid6zIn8TCABer
 q8SXzxozxJtwXgielC7qSX3uwlJT8I8cqEPM1mJV/gpSt6tLQ+bh2Gvbafv803AzdVwqw0HBFGd5/
 dPzp3OdXaLrx1tuaAUgW+DNhQBBR7H7fwJ6ogu0CeLtzKGcj10h99QO8EXSDyrOJDtWNtifqQvG7w
 7KDsg4Zi4BzIGuHix+TBEUMV8c+QidhFfio=
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 14.21.142.155
X-QQ-STYLE: 
X-QQ-mid: webmail632t1751957538t2012164
From: "=?ISO-8859-1?B?eXdlbi5jaGVu?=" <ywen.chen@foxmail.com>
To: "=?ISO-8859-1?B?Q2hyaXN0b3BoIEhlbGx3aWc=?=" <hch@infradead.org>,
 "=?ISO-8859-1?B?RXJpYyBCaWdnZXJz?=" <ebiggers@kernel.org>
Mime-Version: 1.0
Date: Tue, 8 Jul 2025 14:52:17 +0800
X-Priority: 3
Message-ID: <tencent_FCCBB98BA5E88F7B6DFCDC55EC9C23CFF105@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-Spam-Score: 3.4 (+++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  &gt; But I wonder why generic_ci_match is even called that
 often. Both ext4 &gt; and f2fs support hashed lookups, so you should usually
 only see it called &gt; for the main match, plus the occasional [...] 
 Content analysis details:   (3.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ywen.chen(at)foxmail.com]
 0.4 RDNS_DYNAMIC           Delivered to internal network by host with
 dynamic-looking rDNS
 3.2 HELO_DYNAMIC_IPADDR    Relay HELO'd using suspicious hostname (IP addr
 1) 0.0 FROM_EXCESS_BASE64     From: base64 encoded unnecessarily
 0.0 NO_FM_NAME_IP_HOSTN    No From name + hostname using IP address
X-Headers-End: 1uZ2I5-0007ez-Bx
Subject: Re: [f2fs-dev] [PATCH v3 1/2] libfs: reduce the number of memory
 allocations in generic_ci_match
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
Cc: =?ISO-8859-1?B?YnJhdW5lcg==?= <brauner@kernel.org>,
 =?ISO-8859-1?B?dHl0c28=?= <tytso@mit.edu>,
 =?ISO-8859-1?B?bGludXgta2VybmVs?= <linux-kernel@vger.kernel.org>,
 =?ISO-8859-1?B?bGludXgtZjJmcy1kZXZlbA==?=
 <linux-f2fs-devel@lists.sourceforge.net>,
 =?ISO-8859-1?B?Q2hyaXN0b3BoIEhlbGx3aWc=?= <hch@infradead.org>,
 =?ISO-8859-1?B?YWRpbGdlci5rZXJuZWw=?= <adilger.kernel@dilger.ca>,
 =?ISO-8859-1?B?dmlybw==?= <viro@zeniv.linux.org.uk>,
 =?ISO-8859-1?B?bGludXgtZnNkZXZlbA==?= <linux-fsdevel@vger.kernel.org>,
 =?ISO-8859-1?B?amFlZ2V1aw==?= <jaegeuk@kernel.org>,
 =?ISO-8859-1?B?bGludXgtZXh0NA==?= <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

&gt; But I wonder why generic_ci_match is even called that often.  Both ext4
&gt; and f2fs support hashed lookups, so you should usually only see it called
&gt; for the main match, plus the occasional hash false positive, which should
&gt; be rate if the hash works.


At present, in the latest version of Linux, in some scenarios,
f2fs still uses linear search.


The logic of linear search was introduced by Commit 91b587ba79e1
(f2fs: Introduce linear search for dentries). Commit 91b587ba79e1
was designed to solve the problem of inconsistent hashes before
and after the rollback of Commit 5c26d2f1d3f5
("unicode: Don't special case ignorable code points"),
which led to files being inaccessible.


In order to reduce the impact of linear search, in relatively new
versions, the logic of turning off linear search has also been
introduced. However, the triggering conditions for this
turn - off logic on f2fs are rather strict:


1. Use the latest version of the fsck.f2fs tool to correct
the file system.
2. Use a relatively new version of the kernel. (For example,
linear search cannot be turned off in v6.6)


The performance gain of this commit is very obvious in scenarios
where linear search is not turned off. In scenarios where linear
search is turned off, no performance problems will be introduced
either.<br>
_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
