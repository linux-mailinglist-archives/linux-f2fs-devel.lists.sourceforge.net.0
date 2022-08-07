Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C45F58BA3B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Aug 2022 10:30:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oKbfX-0001YO-VM; Sun, 07 Aug 2022 08:29:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <lkp@intel.com>) id 1oKbfQ-0001Y5-U0
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Aug 2022 08:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A1ncLG8TdFt9R2mCI30xMH7Iwuqviw6y7PbmlqDOXek=; b=B+3B6wUyx53fgEkk20Su4Od3Tz
 48+a+3ZCncAEf5giAMWevBdfxY6/9FIMYsuQscFlv6P3zFYzXvszU4/CXKsugC9NAEmDNAn7tZHbK
 NUVBr0oQK7fvHtS/HP14Yq4ZiIGo9j2obMahcsSPUlGdWwuHr/69lSrDZIE578Cd2Mrg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A1ncLG8TdFt9R2mCI30xMH7Iwuqviw6y7PbmlqDOXek=; b=M2GN35RjNzkYQDAo9h+tsMxFbK
 UPPpVFIMY+4irMJgkr28vVNY3MR/JdpZXFagD0kXB+k83oODtz/BtyrSnLSwb7PM7Nl+Pzl4QH5dl
 ww7+alxWFCTM3v9tOqVcEizXQKIoYs4Dq7mQSMAwkpmIPke13MnlK8TnsihyxhrNMxuw=;
Received: from mga01.intel.com ([192.55.52.88])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oKbfH-0005LJ-Qi
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Aug 2022 08:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659860979; x=1691396979;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Zldi7ioVam3SXWkUXMr6S5cw/9YD9h1FQKzs/lHLIFg=;
 b=KVBXqGX+o6cuCFELb+LgWLAXEZIPG62w7IRKhaUoGCiJc9Z7Jc5DOR0e
 K3Z1PC3+hAKh7FkkicSUxKlKCgrG1CvLT7yaercDlLF6e4IOeJw6Ra1gt
 N0NYt6g0ijP4QI99DqkD8+mQ3fuj+oNi4338u1p/o5t+8PZgKqe3NVRWy
 y7wX6dFNMCbrjPdEN61vyBsausR5Jg6I9HB7I/baohFDFmeWyV4wMkQfs
 oTdoxeX/ivUNfe9dW5/GCqtIHyR/kmf7oRJwpDyjzH746yLMgcNMh9x3z
 jxBqjj9KJagc2K3EPVk/fXzZ2oklVjVuKvyvzlMV403IqWcnCkd6mNYwA Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10431"; a="316323562"
X-IronPort-AV: E=Sophos;i="5.93,219,1654585200"; d="scan'208";a="316323562"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2022 01:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,219,1654585200"; d="scan'208";a="746301907"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 07 Aug 2022 01:29:26 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oKbf4-000L9f-0N;
 Sun, 07 Aug 2022 08:29:26 +0000
Date: Sun, 7 Aug 2022 16:29:02 +0800
From: kernel test robot <lkp@intel.com>
To: studentxswpy@163.com, jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-ID: <202208071605.XXehjTqy-lkp@intel.com>
References: <20220801092202.3134668-1-studentxswpy@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220801092202.3134668-1-studentxswpy@163.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, Thank you for the patch! Yet something to improve: [auto
 build test ERROR on next-20220728] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [192.55.52.88 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [192.55.52.88 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oKbfH-0005LJ-Qi
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: Replace kmalloc() with
 f2fs_kmalloc
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
Cc: Hacash Robot <hacashRobot@santino.com>, Xie Shaowen <studentxswpy@163.com>,
 llvm@lists.linux.dev, kbuild-all@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20220728]

url:    https://github.com/intel-lab-lkp/linux/commits/studentxswpy-163-com/f2fs-Replace-kmalloc-with-f2fs_kmalloc/20220801-172502
base:    7c5e07b73ff3011c9b82d4a3286a3362b951ad2b
config: x86_64-randconfig-a002-20220801 (https://download.01.org/0day-ci/archive/20220807/202208071605.XXehjTqy-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ca9f7259448a8dc0a2c4a1ae0a34a8109df4d6e1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review studentxswpy-163-com/f2fs-Replace-kmalloc-with-f2fs_kmalloc/20220801-172502
        git checkout ca9f7259448a8dc0a2c4a1ae0a34a8109df4d6e1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/f2fs/dir.c:235:61: error: too few arguments to function call, expected 3, have 2
                   decrypted_name.name = f2fs_kmalloc(de_name_len, GFP_KERNEL);
                                         ~~~~~~~~~~~~                        ^
   fs/f2fs/f2fs.h:3316:21: note: 'f2fs_kmalloc' declared here
   static inline void *f2fs_kmalloc(struct f2fs_sb_info *sbi,
                       ^
   1 error generated.


vim +235 fs/f2fs/dir.c

   211	
   212	#if IS_ENABLED(CONFIG_UNICODE)
   213	/*
   214	 * Test whether a case-insensitive directory entry matches the filename
   215	 * being searched for.
   216	 *
   217	 * Returns 1 for a match, 0 for no match, and -errno on an error.
   218	 */
   219	static int f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
   220				       const u8 *de_name, u32 de_name_len)
   221	{
   222		const struct super_block *sb = dir->i_sb;
   223		const struct unicode_map *um = sb->s_encoding;
   224		struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
   225		struct qstr entry = QSTR_INIT(de_name, de_name_len);
   226		int res;
   227	
   228		if (IS_ENCRYPTED(dir)) {
   229			const struct fscrypt_str encrypted_name =
   230				FSTR_INIT((u8 *)de_name, de_name_len);
   231	
   232			if (WARN_ON_ONCE(!fscrypt_has_encryption_key(dir)))
   233				return -EINVAL;
   234	
 > 235			decrypted_name.name = f2fs_kmalloc(de_name_len, GFP_KERNEL);
   236			if (!decrypted_name.name)
   237				return -ENOMEM;
   238			res = fscrypt_fname_disk_to_usr(dir, 0, 0, &encrypted_name,
   239							&decrypted_name);
   240			if (res < 0)
   241				goto out;
   242			entry.name = decrypted_name.name;
   243			entry.len = decrypted_name.len;
   244		}
   245	
   246		res = utf8_strncasecmp_folded(um, name, &entry);
   247		/*
   248		 * In strict mode, ignore invalid names.  In non-strict mode,
   249		 * fall back to treating them as opaque byte sequences.
   250		 */
   251		if (res < 0 && !sb_has_strict_encoding(sb)) {
   252			res = name->len == entry.len &&
   253					memcmp(name->name, entry.name, name->len) == 0;
   254		} else {
   255			/* utf8_strncasecmp_folded returns 0 on match */
   256			res = (res == 0);
   257		}
   258	out:
   259		kfree(decrypted_name.name);
   260		return res;
   261	}
   262	#endif /* CONFIG_UNICODE */
   263	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
