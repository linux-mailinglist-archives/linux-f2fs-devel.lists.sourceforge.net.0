Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D5FA1562F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2025 19:00:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tYqdb-0006ZN-Jv;
	Fri, 17 Jan 2025 18:00:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mchehab+huawei@kernel.org>) id 1tYqda-0006ZF-2Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 18:00:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RimRJhO8mN/0VIbcekX4TIH+fDhZfzDhpoNRBIHOHSI=; b=AcFB2l69RU71ReWVA4Dev11udb
 +zLyo+g+QYRXl4Np3BK795Kktsv17aeeAlenKkt47t/Kn26+4RkhR6NAApUQB/PmZS8t2BtpGbabx
 7S0rgUtf3vY+AMpoUVpHEd4tLyiBmGJUx00Z6Onzhqunk2Pp0bElFX0G0LjaXMOXoh50=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RimRJhO8mN/0VIbcekX4TIH+fDhZfzDhpoNRBIHOHSI=; b=B
 cHaO3C6IjxpDueUJDAWldtbFPV02BREYrYwkpZqNhl+wFaUGtvaMN0Wnn8D+PIYdsfNJJSmO8SmDV
 v44jzb/1jJG6JATnbGKLi2hIOB/lUsqfxqgOzaeUEV9xIx64Gg94ENqRjcshi7lYKB7SI2Cxovmt1
 rMCF9ZAmITeotRhI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tYqdZ-0003Yw-UO for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 18:00:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D7AC25C63C8;
 Fri, 17 Jan 2025 17:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7FDAC4CEE2;
 Fri, 17 Jan 2025 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737136795;
 bh=GbqeT7eeAHIjJRdLRDZggAAJcM/bUobSgiiZNrAeh2s=;
 h=From:To:Cc:Subject:Date:From;
 b=UJ4BLVfBc5CgoQgarhyz8frZd3QYr1vcDc2Q23SSXR+RqDZQtU/odh+ZiYIU39zNC
 4Goye5M2FBfXHDElyZQ7t1tD2NWBMpzpZmfcf9XIpBWH4maYz2EhpE7hLxjaKdW9Ti
 Dm3xEBD0kdXOMipbvNS5HVNC1tSBM0ufLIFAeVkQf6CBKC3EtCxwJNQyfEKeoKXOY5
 7CEBYMrCHsZabraQCo0XylISR1P8O2ATNSp57I8fO0WzV5AIvXNB89q4L/mh8J4zPB
 cZVttfxstovxydmK5i+zItsh6M/7UCwzlpHwCX1pueQUgv2Awf3n4imiO0Oj2vRDAY
 6+sBgdQWecUsQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tYqdM-00000006AjU-1Ray; Fri, 17 Jan 2025 18:59:52 +0100
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 17 Jan 2025 18:59:29 +0100
Message-ID: <cover.1737135484.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jon/Greg, The main goal of this RFC is to give a heads
 up of a work I've been doing to replace the get_abi.pl script with a python
 version. Patches 1-6 are OK to be applied: - Patch 1 changes the sort criteria
 of the ABI generation to use alphabetic order: currently, it is *almost*
 alphabetic, but, on some cases, it orders on a different [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tYqdZ-0003Yw-UO
Subject: [f2fs-dev] [PATCH RFC 00/10] Improve ABI documentation generation
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
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Jaegeuk Kim <mchehab+huawei@kernel.org>, James Clark <james.clark@linaro.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Johannes Berg <johannes@sipsolutions.net>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jon/Greg,

The main goal of this RFC is to give a heads up of a work I've been doing to
replace the get_abi.pl script with a python version.

Patches 1-6 are OK to be applied:
- Patch 1 changes the sort criteria of the ABI generation to use alphabetic order:
  currently, it is *almost* alphabetic, but, on some cases, it orders on a different
  way. No changes at the content, just at the order. 
  I wrote it mainly to use the same sort criteria as the new tool, but IMO it is
  worth applying even before we switch to the python version.

- Patches 2-6 fix some ABI tag problems. They're independent of the rest and
  can also be applied without  other patches on this series.

The remaining patches (7-10) are RFC for a new tool.

The new tool uses a cleaned-up version of the same algorithms I wrote in Perl,
re-writen in Python. While doing the conversion, I got rid of some stuff that aren't
needed anymore.

The new tool has two additional changes:
- the validate tool now detects a duplicate definition when files with the same name
  exists on different parts of the ABI documentation (if one asks to build them altogether);
- it fixes a bug on one of the files whose "what" keys weren't properly parsed.

Patches 7 and 8 are already in good shape (IMHO).

Patch 9 replaces "get_abi.pl" by "get_abi.py" exec for htmldocs/pdfdocs targets.
It is not on its final shape, as my end goal is to do a python include and use the
class directly there instead of calling an exec file, but such change will require
some work (I'll likely implement an interactor at the class instead of just returning
a big amount of text).

Patch 10 is just a boilerplate to one additional functionality of the perl script that
would require a lot of work to implement: check undefined/bad defined symbols
at the local machine's sysfs and compare with ABI.

Before getting patches 7-10 merged, I'd like to implement patch 10. This may
take some time, as the ABI check there is not the simplest code I wrote.

Yet, I'd like to get some feedback about patches 7-9 while I'm working on 
patch 10, so, let me send what I have so far as a RFC.

I hope this would make more people look at the code, as right now, we had only
6 persons/6 patches besides me that touched the code.

Mauro Carvalho Chehab (10):
  scripts/get_abi.pl use label to better sort ABI symbols and files
  ABI: sysfs-class-rfkill: fix kernelversion tags
  ABI: sysfs-bus-coresight-*: fix kernelversion tags
  ABI: sysfs-driver-dma-idxd: fix date tags
  ABI: sysfs-fs-f2fs: fix date tags
  ABI: sysfs-power: fix a what tag
  [RFC] scripts: add a get_abi.py tool to generate ReST output
  [RFC] scripts/get_abi.py: add support for symbol search
  [RFC] docs: use get_abi.py for ABI generation
  [RFC BOILERPLATE] scripts/get_abi.py: add support for undefined ABIs

 Documentation/ABI/removed/sysfs-class-rfkill  |   2 +-
 Documentation/ABI/stable/sysfs-class-rfkill   |  12 +-
 .../ABI/stable/sysfs-driver-dma-idxd          |   4 +-
 .../testing/sysfs-bus-coresight-devices-cti   |  78 +-
 .../testing/sysfs-bus-coresight-devices-tpdm  |  52 +-
 Documentation/ABI/testing/sysfs-fs-f2fs       |   4 +-
 Documentation/ABI/testing/sysfs-power         |   2 +-
 Documentation/admin-guide/abi-obsolete.rst    |   1 -
 Documentation/admin-guide/abi-removed.rst     |   1 -
 Documentation/admin-guide/abi-stable.rst      |   1 -
 Documentation/admin-guide/abi-testing.rst     |   1 -
 Documentation/sphinx/kernel_abi.py            |  10 +-
 scripts/get_abi.pl                            |   3 +-
 scripts/get_abi.py                            | 678 ++++++++++++++++++
 14 files changed, 760 insertions(+), 89 deletions(-)
 create mode 100755 scripts/get_abi.py

-- 
2.47.1




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
