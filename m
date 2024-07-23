Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79229939CB5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jul 2024 10:33:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWAxF-0004L7-42;
	Tue, 23 Jul 2024 08:33:05 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youling.tang@linux.dev>) id 1sWAxB-0004JE-F8
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 08:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XEWUV4v7u+8zDSLwsokAOxmgvkvK5NCQfI7UWQX3ezY=; b=ToTAgkZeLLmuklBZCKO23c9xdf
 80NQqgnJqQJXbsETqoH1X7i0pFjOnsB9NU48tQ5KHHrhQBwICh+46V5bozofaWHwvVHXkFiVlZQlm
 24PD3NpKjp6gpm1/qJ8D5wc45Gz/67x4em0Z+81R3kesMaSlaEDqbdXRRk8vhpe6/7eQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XEWUV4v7u+8zDSLwsokAOxmgvkvK5NCQfI7UWQX3ezY=; b=T
 gvmEeDsqnculZUBDiGAuP1m7lR4c5BPE1Kd30ysCokfK+Nj4CwnM5id62BcjsKD1AdIzJVMzpX02u
 hl+RbmP9etMlFLNPfuR6r5WJYjVOzJua8/U+8+7zE0LUzHxcNP9fp65oXuGJPVip0YOxnvi2utGY8
 jKVw4mNgupNmi8uc=;
Received: from out-179.mta0.migadu.com ([91.218.175.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWAxA-0003pM-OW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 08:33:02 +0000
X-Envelope-To: arnd@arndb.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1721723569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=XEWUV4v7u+8zDSLwsokAOxmgvkvK5NCQfI7UWQX3ezY=;
 b=qCSTaiPGYAibGkdZEU+4+DySxYSc6vM6QXszKhbvEh5FkXBkc2A2b86cHsugVAALnS3utO
 wptLiOYtmzG2BDocz7A073mRfyWenfw9V2KK6c3rtcliew6QgINJ1CsRcnUpGOkJv6a+iM
 4fYxMowegjFFk2jQzoZcr8wdA2geKP8=
X-Envelope-To: mcgrof@kernel.org
X-Envelope-To: clm@fb.com
X-Envelope-To: josef@toxicpanda.com
X-Envelope-To: dsterba@suse.com
X-Envelope-To: tytso@mit.edu
X-Envelope-To: adilger.kernel@dilger.ca
X-Envelope-To: jaegeuk@kernel.org
X-Envelope-To: chao@kernel.org
X-Envelope-To: hch@infradead.org
X-Envelope-To: linux-arch@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-modules@vger.kernel.org
X-Envelope-To: linux-btrfs@vger.kernel.org
X-Envelope-To: linux-ext4@vger.kernel.org
X-Envelope-To: linux-f2fs-devel@lists.sourceforge.net
X-Envelope-To: youling.tang@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Youling Tang <youling.tang@linux.dev>
To: Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, tytso@mit.edu,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Christoph Hellwig <hch@infradead.org>
Date: Tue, 23 Jul 2024 16:32:35 +0800
Message-Id: <20240723083239.41533-1-youling.tang@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This series provides the module_subinit{_noexit} and
 module_subeixt helper macros and applies to btrfs,
 ext4 and f2fs. See link [1] for the previous
 discussion process. [1]:
 https://lore.kernel.org/all/20240711074859.366088-1-youling.tang@linux.dev/
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.dev]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [91.218.175.179 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.179 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.179 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sWAxA-0003pM-OW
Subject: [f2fs-dev] [PATCH 0/4] Add module_subinit{_noexit} and
 module_subeixt helper macros
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-modules@vger.kernel.org,
 youling.tang@linux.dev, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series provides the module_subinit{_noexit} and module_subeixt helper 
macros and applies to btrfs, ext4 and f2fs.

See link [1] for the previous discussion process.

[1]: https://lore.kernel.org/all/20240711074859.366088-1-youling.tang@linux.dev/

Youling Tang (4):
  module: Add module_subinit{_noexit} and module_subeixt helper macros
  btrfs: Use module_subinit{_noexit} and module_subeixt helper macros
  ext4: Use module_{subinit, subexit} helper macros
  f2fs: Use module_{subinit, subeixt} helper macros

 fs/btrfs/super.c                  | 123 +++++---------------------
 fs/ext4/super.c                   | 115 +++++++-----------------
 fs/f2fs/debug.c                   |   3 +-
 fs/f2fs/f2fs.h                    |   4 +-
 fs/f2fs/super.c                   | 139 +++++++-----------------------
 include/asm-generic/vmlinux.lds.h |   5 ++
 include/linux/init.h              |  62 ++++++++++++-
 include/linux/module.h            |  22 +++++
 8 files changed, 180 insertions(+), 293 deletions(-)

-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
