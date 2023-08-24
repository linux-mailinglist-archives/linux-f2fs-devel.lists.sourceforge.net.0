Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBA57866EB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Aug 2023 06:54:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZ2MJ-0005ht-QB;
	Thu, 24 Aug 2023 04:54:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1qZ2MH-0005hh-Qp
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Aug 2023 04:54:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pHPRRzSzE3sZBcGjtYm3DoD6XWgrcwZFg8tbTibGqK8=; b=dVZxFuC8tY9q19zXjngL08IQqT
 ZsdcKFUZyAM6XhR7arIIRAC33NRfC002HmLyfje01MHZtAD2HOaF1dfq6QP625IduwEdJRtwBUZJQ
 fudC1EIxU6rAcIF6OjzqDe7Buh/8WfsUKkdbL34hTThGfbXzpZk8NjGtVslHg9ADfc10=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pHPRRzSzE3sZBcGjtYm3DoD6XWgrcwZFg8tbTibGqK8=; b=W1qYcBixjVugusJ+uMPyArod+m
 1q5qg8K1Im6wet8E+ZfAauJQfaASWWNChkw3qO3Tah9R8w8V1eXspXy7QoVnvdbtKhS7DPAByj/aW
 mvl1IoPlR+M2uNuiGvBu2IXXSyatCDAakmsyOsu+cOtYpD0FFgD5toefV6C3fxoEhDXo=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZ2MC-00DhqP-B7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Aug 2023 04:54:12 +0000
Received: from cwcc.thunk.org (pool-173-48-116-73.bstnma.fios.verizon.net
 [173.48.116.73]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 37O4rkR7029647
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Aug 2023 00:53:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1692852829; bh=pHPRRzSzE3sZBcGjtYm3DoD6XWgrcwZFg8tbTibGqK8=;
 h=From:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=bWxz029vUw79AEwNec1FFEciZHOHekAcoXNqhnfX1YANLOlhZi4y31mwcHoNQkgNw
 OUniUvoL2csY6ldMqeGk/p3hmpTT9xGYWisdPfCbF2meNOkBw1Z1r0XMij7/Cw9Rz5
 dy9ChIQllg59CphataMoXGDNvelsl+KHxLIxNEC0sAZEhzUQ3HKv5tz8yenp+B9ff9
 9kEpvnnSXpr6OkKGSj0v5gqPitrC33V4sWNj1PuwE8tVaTHzMbyne4rDJRfSS9o5nF
 7EeM4A7I2O4Oxl6Ws2xIpmvSMX5JTRGsv2eYXITv0Y2rjXVAZv15qP4igd2y7mXlWH
 X/vnSD7QpXxow==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 5C51015C027F; Thu, 24 Aug 2023 00:53:46 -0400 (EDT)
From: "Theodore Ts'o" <tytso@mit.edu>
To: linux-ext4@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>
Date: Thu, 24 Aug 2023 00:53:40 -0400
Message-Id: <169285281340.4146427.15192425840892165678.b4-ty@mit.edu>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230814182903.37267-1-ebiggers@kernel.org>
References: <20230814182903.37267-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 14 Aug 2023 11:29:00 -0700, Eric Biggers wrote: >
 This series makes unexpected casefold flags on inodes be consistently >
 rejected
 early on so that additional validation isn't needed later on [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qZ2MC-00DhqP-B7
Subject: Re: [f2fs-dev] [PATCH 0/3] Simplify rejection of unexpected
 casefold inode flag
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
Cc: linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@suse.de>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On Mon, 14 Aug 2023 11:29:00 -0700, Eric Biggers wrote:
> This series makes unexpected casefold flags on inodes be consistently
> rejected early on so that additional validation isn't needed later on
> during random filesystem operations.  For additional context, refer to
> the discussion on patch 1 of
> https://lore.kernel.org/linux-fsdevel/20230812004146.30980-1-krisman@suse.de/T/#u
> 
> Applies to v6.5-rc6
> 
> [...]

Applied, thanks!

[1/3] ext4: reject casefold inode flag without casefold feature
      commit: 3d0f06b5a4e6d09b4a27d701f2ec9a7de8dadbe5
[2/3] ext4: remove redundant checks of s_encoding
      commit: fe9ef4ceae694597fe7318aafd7357cc5b85724e
[3/3] libfs: remove redundant checks of s_encoding
      commit: 6d7772c4427aaa21251c629d4fabb17e5c10a463

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
