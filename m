Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E41A011392D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Dec 2019 02:18:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1icfma-0004NV-36; Thu, 05 Dec 2019 01:18:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <lkp@intel.com>) id 1icfmY-0004NE-Ot
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Dec 2019 01:18:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bDleUB60rHdPRMB5tvec0XB6KGArml+toMw5kPow3z8=; b=dX/cablTvXp427+hNiXp97jI3K
 FoYGFQPc/conPHF86HHZgpe8jHB5lNWKhe8J4LbIz4OS0m62wTbpFXZFlCbIAxIJhsZO/WJgW2LFF
 jjTElds8vNniNc5e83ibin8wNHQVXlB+/t8U5VvJTTxnpgLvwNL4sz750ogEehouZJds=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bDleUB60rHdPRMB5tvec0XB6KGArml+toMw5kPow3z8=; b=KWM9ElT3+lhs+GutXcGnJBxqP0
 Yk+a10gK4laWE31IqWTAg1e8vGOD3ZDXSjxsCO2ZQOwwoXghd7SQlnARsiNsAK/ugXXjrH4vwV2cd
 Za1zUsI+PZT8/ymBBdIdQB1sZY367h2FX9k74GwnnfB+AmPYE+Fz/7wlDEE+tadZ5Pks=;
Received: from mga12.intel.com ([192.55.52.136])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1icfmW-007PMN-TI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Dec 2019 01:18:15 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 17:18:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,279,1571727600"; d="scan'208";a="208989540"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 04 Dec 2019 17:18:03 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1icfmJ-0009QL-P1; Thu, 05 Dec 2019 09:17:59 +0800
Date: Thu, 5 Dec 2019 09:17:15 +0800
From: kbuild test robot <lkp@intel.com>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <201912050955.3f2DMo5g%lkp@intel.com>
References: <20191203051049.44573-6-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203051049.44573-6-drosen@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: stackoverflow.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1icfmW-007PMN-TI
Subject: Re: [f2fs-dev] [PATCH 5/8] f2fs: Handle casefolding with Encryption
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
Cc: Theodore Ts'o <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 Jonathan Corbet <corbet@lwn.net>, kernel-team@android.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-fsdevel@vger.kernel.org, kbuild-all@lists.01.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Daniel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20191202 next-20191204]
[cannot apply to ext4/dev f2fs/dev-test v5.4 v5.4-rc8 v5.4-rc7 v5.4]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Daniel-Rosenberg/Support-for-Casefolding-and-Encryption/20191203-131410
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 76bb8b05960c3d1668e6bee7624ed886cbd135ba
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-91-g817270f-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> fs/f2fs/dir.c:205:13: sparse: sparse: incorrect type in assignment (different base types) @@    expected int len @@    got restricted __le16 [usertyint len @@
>> fs/f2fs/dir.c:205:13: sparse:    expected int len
   fs/f2fs/dir.c:205:13: sparse:    got restricted __le16 [usertype] name_len
--
>> fs/f2fs/hash.c:90:27: sparse: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [usertype] f2fs_hash @@    got __le32 [usertype] f2fs_hash @@
>> fs/f2fs/hash.c:90:27: sparse:    expected restricted __le32 [usertype] f2fs_hash
>> fs/f2fs/hash.c:90:27: sparse:    got unsigned long long
   fs/f2fs/hash.c:133:24: sparse: sparse: incorrect type in return expression (different base types) @@    expected restricted __le32 @@    got e32 @@
   fs/f2fs/hash.c:133:24: sparse:    expected restricted __le32
   fs/f2fs/hash.c:133:24: sparse:    got int
   fs/f2fs/hash.c:141:11: sparse: sparse: incorrect type in assignment (different base types) @@    expected int r @@    got restricted __int r @@
   fs/f2fs/hash.c:141:11: sparse:    expected int r
   fs/f2fs/hash.c:141:11: sparse:    got restricted __le32
   fs/f2fs/hash.c:144:16: sparse: sparse: incorrect type in return expression (different base types) @@    expected restricted __le32 @@    got le32 @@
   fs/f2fs/hash.c:144:16: sparse:    expected restricted __le32
   fs/f2fs/hash.c:144:16: sparse:    got int r

vim +205 fs/f2fs/dir.c

   199	
   200		if (de->hash_code != namehash)
   201			return false;
   202	
   203	#ifdef CONFIG_UNICODE
   204		name = d->filename[bit_pos];
 > 205		len = de->name_len;
   206	
   207		if (sb->s_encoding && needs_casefold(parent)) {
   208			if (cf_str->name) {
   209				struct qstr cf = {.name = cf_str->name,
   210						  .len = cf_str->len};
   211				return !f2fs_ci_compare(parent, &cf, name, len, true);
   212			}
   213			return !f2fs_ci_compare(parent, fname->usr_fname, name, len,
   214						false);
   215		}
   216	#endif
   217		if (fscrypt_match_name(fname, d->filename[bit_pos],
   218					le16_to_cpu(de->name_len)))
   219			return true;
   220		return false;
   221	}
   222	

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
