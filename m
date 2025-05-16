Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1705AB9A00
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 May 2025 12:22:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sit5pUV8JF7+NOnUZlQRvas7qg8cJGbe5gcm4l2Re0s=; b=mkaBzkcld80ekdQ5JHNs1BDAsy
	00pYv6DHVkVAWrCIJtka2BJwK7L3Q10T9sMa+Tm24NYywDjyle0GrvFTQpxjupRKoswH74XlXZwRZ
	u2dKfttAAHxtzdxxYxeC5+nyH1Cykg6qXWXOgfJ5dhecN8l3ST/90rMsMHtqxNdCwlo8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uFsCS-0002S7-D9;
	Fri, 16 May 2025 10:21:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dan.carpenter@linaro.org>) id 1uFsCR-0002Rx-A5
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 May 2025 10:21:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=35iuGSg19HNEf/U+dvDwmkcAkhrHkl1GiGSFAGoPNXY=; b=BbYG6z5bXd6J8TLWHTf34BxytX
 gTUVlf7LjhB+8gfWDAxuy0QcDlEYaBWsPmXsuH1jI80UIY37ck1/KTLKcTn+ra2nJF/RKhIqZ9UR/
 3scxoifVFXVbucNdqUzI5CrgERAjLdVBnAv+NnKCZ5bKz5kOJxj9txn1Vn7RZRDdFeEA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=35iuGSg19HNEf/U+dvDwmkcAkhrHkl1GiGSFAGoPNXY=; b=d
 FIZxuTFsgx3UDGha9RAMpN1KDmpkxo3hAClFoX8ILHR0WVwy9t443Bhdb98Qo8jCtvKC3K9o3h/cm
 PA9amqYxByWH+Ob/NRjhVhv1BijA4I5VeMpYAc7E7xn0w82xZ85gWYB2s4fIo5HUmuUFpYtYHICXy
 G8cIf+n2CUW/F7Ls=;
Received: from mail-ed1-f43.google.com ([209.85.208.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uFsCQ-0007At-K4 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 May 2025 10:21:55 +0000
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-60179d8e65fso730925a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 May 2025 03:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747390903; x=1747995703; darn=lists.sourceforge.net;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=35iuGSg19HNEf/U+dvDwmkcAkhrHkl1GiGSFAGoPNXY=;
 b=lQ4DAIYB21KgpImQPk1i39NKaqnygrJrNqGc7FHh1foIK/3QEbCslEPg8+IS7TQ7Fx
 zeWUrofhx6ukJCbU/abX2WwIdv91X0+2djgXVU6ZwdxDb0WPDP50Fr3fdiB8sTs/MU9q
 oNFrJj6xtYiSoUHMFg/kWnj7CBzpanQKKfb6HUNAkk1cycJ7Pj61P1KgThTIAVmy/hsv
 cvWdOhjs5C8PlmcFgkSseRY0Bh1hNDwZWATtQbe2VS4LsseYuQ5OCb4IBM2kFdYbzDtA
 F9juNHdfwLWnXZevwxkX5nxkshwVBNQ/KbTjwFBPfv9J8juXI1jyK+Sbnd98C6nSsgq1
 sAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747390903; x=1747995703;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=35iuGSg19HNEf/U+dvDwmkcAkhrHkl1GiGSFAGoPNXY=;
 b=YsLgHaLntK6yMrlCMNxMu/R/jJ3GDCEJbHnMxuY5UG46PbilpPGofzx7qYCLbmyzdZ
 2qvJcPwhdOG5C+58RMtJibzIOYx7PVxQYsgsk5mFjdjq3sCZ+xBAGmasSXErNK2S/cUW
 oOZHDCZZmu3PlPzRdSdGklnnvsUORILWncGR+NOwpRlIFVOekcgpvkMM2wyxvqUN+lkf
 55wNtFPxDPIUeDjyzkp5Auox4iDG/ok1b4U0njDDQjunbQLUgLi25cWMlxDtJ8olvzGJ
 6ArJX3lVUnujCRa118IUtF21laOy1Kx54s9ldtY0jRhT1cRYc0cVBsUj2MDtptc8VpHt
 6M9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmacwxYGabGpHu9GYgGbLG/Y6iiXE4OdwEo+55CwyiJDz3TctKYeqFK8ix0jT2HdCcLeAh0xhXGjT1omuNLVlW@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwS5/gF23oO3k79YMVn34fyS5WqiF2nQP7GBTxN1UFB+OAamwMe
 YmrxpfRRyYe5AFWI3BMRiCbVQqMxJE/kvunc/o46v3+oZ9Mx0ghTcGUqo/G/qeKva9ppqf4HWAs
 5X5TkfnY=
X-Gm-Gg: ASbGncvkvADQbP8zA0Z/0ju7zkaPwOeJNgeKLFXCPVZj7d/z83fREWFjRyjj9OcIpNX
 o8eu4TgwEmgnYZz2ji/M3BjlXcuzlNyqPjqNCgqsW70CF97cxImn16DDeV+JNhhVc8rJRbS7KO+
 P5KUtOaEG6zadTfNdScJLJtjLh8BCk96G9OgMIWl0CGV+2hu/aCCzsFJk0NioZwjeZZR6J9V/3s
 bSEwTkceHE5p/RH26a4pGV+Uoed+XBvtoO8SzKEC5nePBjcK3qUmXtcU+g4IvwO0h8KdwWTV+Hz
 U5x9itsDHSajDuklNT/tFYfwd/zInyNPX6BIfE2ccskul1ImvWcvbGKgmKMLoZR809cyjmWVGAD
 dbkQ3jg==
X-Google-Smtp-Source: AGHT+IEACVWcPM/40CEX74K+kwkoPGzVs9ttaJUL8etUJoESajJD4/e7H2ZVUTxnLFX0e9j2VAI7cQ==
X-Received: by 2002:a05:6000:2dc5:b0:38d:d701:419c with SMTP id
 ffacd0b85a97d-3a35c84bdf9mr2371964f8f.41.1747389374999; 
 Fri, 16 May 2025 02:56:14 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f39ef832sm99363455e9.40.2025.05.16.02.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 02:56:14 -0700 (PDT)
Date: Fri, 16 May 2025 12:56:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hongbo Li <lihongbo22@huawei.com>
Message-ID: <2f16981b-0e13-4c64-83a8-d0e0b4297348@suswa.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: 869734b9a4ef9440e80dba629c688ed3277a7779 commit:
 33c0363d5e5bbd712480e048a1ff67a3bca84ba1
 [187/191] f2fs: introduc [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.43 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.43 listed in wl.mailspike.net]
X-Headers-End: 1uFsCQ-0007At-K4
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 187/191] fs/f2fs/super.c:858
 f2fs_parse_param() warn: impossible condition '(result.int_32 > ((~0 >>
 1))) => (s32min-s32max > s32max)'
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
Cc: Eric Sandeen <sandeen@redhat.com>, lkp@intel.com,
 Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net,
 oe-kbuild-all@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   869734b9a4ef9440e80dba629c688ed3277a7779
commit: 33c0363d5e5bbd712480e048a1ff67a3bca84ba1 [187/191] f2fs: introduce fs_context_operation structure
config: x86_64-randconfig-161-20250515 (https://download.01.org/0day-ci/archive/20250516/202505161519.EW2OO7Cw-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505161519.EW2OO7Cw-lkp@intel.com/

smatch warnings:
fs/f2fs/super.c:858 f2fs_parse_param() warn: impossible condition '(result.int_32 > ((~0 >> 1))) => (s32min-s32max > s32max)'

vim +858 fs/f2fs/super.c

7c2e59632b846a Jaegeuk Kim      2018-01-04   848  	case Opt_resgid:
419819cc34ee43 Hongbo Li        2025-04-23   849  		F2FS_CTX_INFO(ctx).s_resgid = result.gid;
419819cc34ee43 Hongbo Li        2025-04-23   850  		ctx->spec_mask |= F2FS_SPEC_resgid;
7c2e59632b846a Jaegeuk Kim      2018-01-04   851  		break;
36abef4e796d38 Jaegeuk Kim      2016-06-03   852  	case Opt_mode:
419819cc34ee43 Hongbo Li        2025-04-23   853  		F2FS_CTX_INFO(ctx).fs_mode = result.uint_32;
419819cc34ee43 Hongbo Li        2025-04-23   854  		ctx->spec_mask |= F2FS_SPEC_mode;
36abef4e796d38 Jaegeuk Kim      2016-06-03   855  		break;
4cb037ec3f754f Chengguang Xu    2018-09-12   856  #ifdef CONFIG_F2FS_FAULT_INJECTION
73faec4d99358b Jaegeuk Kim      2016-04-29   857  	case Opt_fault_injection:
5cefc0eae8b492 Hongbo Li        2025-04-23  @858  		if (result.int_32 > INT_MAX)

What is the point of this check?  Obviously an int can't be more than
INT_MAX?  Was something else intended?

4ed886b187f474 Chao Yu          2024-05-07   859  			return -EINVAL;
419819cc34ee43 Hongbo Li        2025-04-23   860  		F2FS_CTX_INFO(ctx).fault_info.inject_rate = result.int_32;
419819cc34ee43 Hongbo Li        2025-04-23   861  		ctx->spec_mask |= F2FS_SPEC_fault_injection;
419819cc34ee43 Hongbo Li        2025-04-23   862  		ctx_set_opt(ctx, F2FS_MOUNT_FAULT_INJECTION);
d494500a704342 Chao Yu          2018-08-08   863  		break;
4cb037ec3f754f Chengguang Xu    2018-09-12   864  
d494500a704342 Chao Yu          2018-08-08   865  	case Opt_fault_type:
5cefc0eae8b492 Hongbo Li        2025-04-23   866  		if (result.uint_32 > BIT(FAULT_MAX))
4ed886b187f474 Chao Yu          2024-05-07   867  			return -EINVAL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
