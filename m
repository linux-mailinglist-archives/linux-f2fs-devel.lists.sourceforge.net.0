Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF07A2E8EC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Feb 2025 11:18:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1thQs9-0003yq-5R;
	Mon, 10 Feb 2025 10:18:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mchehab+huawei@kernel.org>) id 1thQs6-0003yV-M4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Feb 2025 10:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iWu6lxVdt4DkLo8TsXZLVD2K1CQXEitCDCNfEX4Lczg=; b=Iv2BQvAjMbZOnt1ibqd2HSge3e
 44lDDYQc+hI27IMBoh5faB7aBpIZiKWNrrCbG9hlZ80m/zXhpqM5xmTqyino8ohPjqPyR4BlLBr2j
 8sbskgJNgnESbM+1FbxmGgsDNRx2ox4xYw6X7Qskjq+UiieW1PQHW6d1eLDKidsWF+Lw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iWu6lxVdt4DkLo8TsXZLVD2K1CQXEitCDCNfEX4Lczg=; b=g
 I9sqHAVmej246BwA1bqnmAF56uHLzbe1/bbb+hudhtL7vOspQYyIxTNKG+ay98bLRfa08wNWHBWr1
 U/nFAdDZ7DJf256WGvQTvP+PY22Lr5/B4+yH4o4oasKk1Qf9DMMxeXiMcxksJQuhO1PhnnjC+IBQ5
 gw+NfTidVuvxTAzI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1thQs6-00041c-H7 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Feb 2025 10:18:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8B88A5C48CC;
 Mon, 10 Feb 2025 10:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56D2C4CEE6;
 Mon, 10 Feb 2025 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739182703;
 bh=p8iRm7Gznn3ekKIRR91V/psR21ij9bK+0II7DymWAjA=;
 h=From:To:Cc:Subject:Date:From;
 b=PX0+CSSljZXtmDbUPsW3q/1UEAZkcJHQHMj/eR0Q8uSPrNmrv7jqsd3H+YWo1xOM/
 HjMrHdx6LlY4VekopfJmqAvseecf+sebvVrDYeBP2E4GKMMrmkGAF7v22e90DTf2Ge
 mjxsRdCf7qv3lINGQIUrTR/CKUR1x2WI5IgNnSnIRO7tiHp3FFc+3cqvsj/9hsWnKh
 QUvK4DWNq98U6G9Jmn/ZLIwMSS34I6YncKIZUQdrGDo3GiokB90neYSGG7qvgPEeX+
 u8zr8PFfVeA+4pAnIe0oPCCKpjgmBbYQ3zyMgD9kNY5qkMBCxcJD7jQPVUsrPO+vlG
 qr78nANSqX06Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1thQrt-00000006Ci9-3Zgs; Mon, 10 Feb 2025 11:18:21 +0100
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Mon, 10 Feb 2025 11:17:49 +0100
Message-ID: <cover.1739182025.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jon/Greg, This series replace get_abi.pl with a Python
 version. I originally started it due to some issues I noticed when searching
 for ABI symbols. While I could just go ahead and fix the already existing
 script, I noticed that the script maintainance didn't have [...] 
 Content analysis details:   (-6.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1thQs6-00041c-H7
Subject: [f2fs-dev] [PATCH 00/27] Improve ABI documentation generation
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
From: Mauro Carvalho Chehab via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Tony Luck <tony.luck@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Jaegeuk Kim <mchehab+huawei@kernel.org>, James Clark <james.clark@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-hardening@vger.kernel.org,
 coresight@lists.linaro.org, Johannes Berg <johannes@sipsolutions.net>,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jon/Greg,

This series replace get_abi.pl with a Python version.

I originally started it due to some issues I noticed when searching for
ABI symbols. While I could just go ahead and fix the already existing
script, I noticed that the script maintainance didn't have much care over
all those years, probably because it is easier to find Python programmers
those days.

Also, the code is complex and was not using modules or classes and
were using lots of global variables.

So, I decided to rewrite it in Python. I started with a manual conversion
for each function. Yet, to avoid future maintainership issues, I opted to
divide the main code on three classes, each on a sepaparate file.

Just like the original RFC, I opted to keep the Sphinx kernel-abi module
on three different phases:

- call get_abi.py as an exec file;
- import AbiParser on a minimal integration scenario;
- cleanup the code to avoid needing to parse line numbers from the text.

This way, if something goes wrong, it would be easier to just revert any
offending patches, It also provides a better rationale about what each
logical change is doing.

The initial patches on this series do some preparation work and
cleans some ABI symbol bugs that lack ":" delimiter.

I opted to place on this series the Sphinx and Python version updates.

I still have ~10 patches here with additional cleanups, from the original
series I sent as RFC but let's get the main changes merged first.

Mauro Carvalho Chehab (27):
  docs: sphinx: remove kernellog.py file
  docs: sphinx/kernel_abi: adjust coding style
  docs: admin-guide: abi: add SPDX tags to ABI files
  ABI: sysfs-class-rfkill: fix kernelversion tags
  ABI: sysfs-bus-coresight-*: fix kernelversion tags
  ABI: sysfs-driver-dma-idxd: fix date tags
  ABI: sysfs-fs-f2fs: fix date tags
  ABI: sysfs-power: fix a what tag
  scripts/documentation-file-ref-check: don't check perl/python scripts
  scripts/get_abi.py: add a Python tool to generate ReST output
  scripts/get_abi.py: add support for symbol search
  docs: use get_abi.py for ABI generation
  scripts/lib/abi/abi_parser.py: optimize parse_abi() function
  scripts/lib/abi/abi_parser.py: use an interactor for ReST output
  docs: sphinx/kernel_abi: use AbiParser directly
  docs: sphinx/kernel_abi: reduce buffer usage for ABI messages
  docs: sphinx/kernel_abi: properly split lines
  scripts/get_abi.pl: Add filtering capabilities to rest output
  scripts/get_abi.pl: add support to parse ABI README file
  docs: sphinx/kernel_abi: parse ABI files only once
  docs: admin-guide/abi: split files from symbols
  docs: sphinx/automarkup: add cross-references for ABI
  docs: sphinx/kernel_abi: avoid warnings during Sphinx module init
  scripts/lib/abi/abi_parser.py: Rename title name for ABI files
  scripts/lib/abi/abi_parser.py: make it backward-compatible with Python
    3.6
  scripts/get_abi.py: add support for undefined ABIs
  scripts/get_abi.pl: drop now obsoleted script

 Documentation/ABI/removed/sysfs-class-rfkill  |    2 +-
 Documentation/ABI/stable/sysfs-class-rfkill   |   12 +-
 .../ABI/stable/sysfs-driver-dma-idxd          |    4 +-
 .../testing/sysfs-bus-coresight-devices-cti   |   78 +-
 .../testing/sysfs-bus-coresight-devices-tpdm  |   52 +-
 Documentation/ABI/testing/sysfs-fs-f2fs       |    4 +-
 Documentation/ABI/testing/sysfs-power         |    2 +-
 .../admin-guide/abi-obsolete-files.rst        |    7 +
 Documentation/admin-guide/abi-obsolete.rst    |    6 +-
 Documentation/admin-guide/abi-readme-file.rst |    6 +
 .../admin-guide/abi-removed-files.rst         |    7 +
 Documentation/admin-guide/abi-removed.rst     |    6 +-
 .../admin-guide/abi-stable-files.rst          |    7 +
 Documentation/admin-guide/abi-stable.rst      |    6 +-
 .../admin-guide/abi-testing-files.rst         |    7 +
 Documentation/admin-guide/abi-testing.rst     |    6 +-
 Documentation/admin-guide/abi.rst             |   17 +
 Documentation/sphinx/automarkup.py            |   47 +
 Documentation/sphinx/kernel_abi.py            |  162 ++-
 Documentation/sphinx/kerneldoc.py             |   14 +-
 Documentation/sphinx/kernellog.py             |   22 -
 Documentation/sphinx/kfigure.py               |   81 +-
 scripts/documentation-file-ref-check          |    2 +-
 scripts/get_abi.pl                            | 1103 -----------------
 scripts/get_abi.py                            |  214 ++++
 scripts/lib/abi/abi_parser.py                 |  628 ++++++++++
 scripts/lib/abi/abi_regex.py                  |  234 ++++
 scripts/lib/abi/helpers.py                    |   38 +
 scripts/lib/abi/system_symbols.py             |  378 ++++++
 29 files changed, 1830 insertions(+), 1322 deletions(-)
 create mode 100644 Documentation/admin-guide/abi-obsolete-files.rst
 create mode 100644 Documentation/admin-guide/abi-readme-file.rst
 create mode 100644 Documentation/admin-guide/abi-removed-files.rst
 create mode 100644 Documentation/admin-guide/abi-stable-files.rst
 create mode 100644 Documentation/admin-guide/abi-testing-files.rst
 delete mode 100644 Documentation/sphinx/kernellog.py
 delete mode 100755 scripts/get_abi.pl
 create mode 100755 scripts/get_abi.py
 create mode 100644 scripts/lib/abi/abi_parser.py
 create mode 100644 scripts/lib/abi/abi_regex.py
 create mode 100644 scripts/lib/abi/helpers.py
 create mode 100644 scripts/lib/abi/system_symbols.py

-- 
2.48.1




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
