Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD117F395A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Nov 2023 23:39:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r5ZPH-000364-UC;
	Tue, 21 Nov 2023 22:39:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1r5ZPF-00035y-77
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Nov 2023 22:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=54qNRG1MA7StMTbbY3j7i2EWu4W3pJYuYtzAhwJgf2k=; b=SivXNTV8d7V+zETlACn1/3TEoo
 Jy5RHbvO0Gz1m5rwEt9MSQ5fEpy5gNJxXbtM22PEW9jpTMNeB5Dz3ImFwBMYjuboiYc0Vwr4arRc8
 muFAyo09pKpMYa+sTvAtMKFK9ycV3CGODtMtmk+tZ106uFvHA7OWZpiV7ejctw38GLRk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=54qNRG1MA7StMTbbY3j7i2EWu4W3pJYuYtzAhwJgf2k=; b=UfqXenNJZeNfC69tlm4TBWVuhP
 3ALRndybqm0s+bhcRaM6+8iD4AcI4Nc/a6NggHe4LOKutuzwElGJE0/Khs2mDLWbikb2614dNvIFD
 aMVx5qXf6F+tb6ECKGWxQ9KWVU7Rb8sXoD+4o0/WSnAUZIUHDujeVzQ1HHNVTjJNLaSA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r5ZPD-0006YD-LU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Nov 2023 22:39:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1DDCBCE1DD2;
 Tue, 21 Nov 2023 22:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 372DCC433CA;
 Tue, 21 Nov 2023 22:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700606376;
 bh=KtsSq5LYvPatFAAXEjl+Y4OaaAiq0o6mzQHlHZHSUC4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pm0hdeERQdM86iFIoenPcFcCHMgeHmJ5ufw1PyLPxu3eurY+ylVFB3V7VF6CUIe3o
 dgBuXop3SNQ7eSXkgyl33LvcRTmsosZqpfm1Oq071kcquPsWmQ2VSLbpdXT9HCATOt
 IFqRGJlQQXjS0XvHw50LI+HZ70xqaZ7O4zcv/EutWn2keDZMoIh7H2iU37x8Bvb9PW
 7mTg2WJEV0zRMbi5JcNw4ThThFDf0lMsYfOFHb/11z6QlZf+QSQQ1eikoIprv/YFbQ
 iJn8DNQXc8vygVj+20jAfHjkR1i1ybaM8X1ZA5H2ec/A+opn7I/hb0Qe30/5iKYmuD
 13RLPhNS+yflg==
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Tue, 21 Nov 2023 14:39:07 -0800
Message-ID: <20231121223909.4617-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231121223909.4617-1-ebiggers@kernel.org>
References: <20231121223909.4617-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com>
 '_require_xfs_io_command
 set_encpolicy -s' does not work as expected because the following in the
 output of 'xfs_io -c "help set_encpolicy"': -s LOG2_DUSIZE -- log2 of data
 unit size 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r5ZPD-0006YD-LU
Subject: [f2fs-dev] [PATCH v2 2/4] common/rc: fix _require_xfs_io_command
 with digits in argument
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 Daniel Rosenberg <drosen@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

'_require_xfs_io_command set_encpolicy -s' does not work as expected
because the following in the output of 'xfs_io -c "help set_encpolicy"':

     -s LOG2_DUSIZE -- log2 of data unit size

... does not match the regex:

    "^ -s ([a-zA-Z_]+ )?--"

... because the 2 in the argument name LOG2_DUSIZE is not matched.  Fix
the regex to support digits in the argument name.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 common/rc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/common/rc b/common/rc
index cc92fe06..dab672d8 100644
--- a/common/rc
+++ b/common/rc
@@ -2719,21 +2719,21 @@ _require_xfs_io_command()
 	echo $testio | grep -q "foreign file active" && \
 		_notrun "xfs_io $command $param_checked not supported on $FSTYP"
 	echo $testio | grep -q "Function not implemented" && \
 		_notrun "xfs_io $command $param_checked support is missing (missing syscall?)"
 	echo $testio | grep -q "unknown flag" && \
 		_notrun "xfs_io $command $param_checked support is missing (unknown flag)"
 
 	[ -n "$param" ] || return
 
 	if [ -z "$param_checked" ]; then
-		$XFS_IO_PROG -c "help $command" | grep -E -q "^ $param ([a-zA-Z_]+ )?--" || \
+		$XFS_IO_PROG -c "help $command" | grep -E -q "^ $param ([a-zA-Z0-9_]+ )?--" || \
 			_notrun "xfs_io $command doesn't support $param"
 	else
 		# xfs_io could result in "command %c not supported" if it was
 		# built on kernels not supporting pwritev2() calls
 		echo $testio | grep -q "\(invalid option\|not supported\)" && \
 			_notrun "xfs_io $command doesn't support $param"
 	fi
 
 	# On XFS, ioctl(FSSETXATTR)(called by xfs_io -c "chattr") maskes off unsupported
 	# or invalid flags silently so need to check these flags by extra ioctl(FSGETXATTR)
-- 
2.42.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
