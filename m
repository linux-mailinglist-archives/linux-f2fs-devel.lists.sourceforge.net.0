Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC24E9A95FE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2024 04:09:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t34Kd-0007vQ-Hg;
	Tue, 22 Oct 2024 02:09:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t34Kb-0007vJ-Ko
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Oct 2024 02:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wKuNeTxyA6ey+asvKZBgAIFJTjbzywm2ZPv7wP+MiLY=; b=aOBj10W80Yj+/BJkP7PQWbr4IY
 2HPQbL0pn/Z6Zb6QQTyIcAHsQrTR0UGg4SxcDrHVle5xJe25wQAVjNL8123Nf/wPixzL3oa0NJNBY
 K7ErlfJ5vLfX0pwzbj71dzrAQis5mT1nMs/UoLS6ow9ZN9BNQW0OeIN6a4Ow/jYesu88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wKuNeTxyA6ey+asvKZBgAIFJTjbzywm2ZPv7wP+MiLY=; b=gheSfckefTU+5GUhGQIaTUDX6P
 2Yn6pX0i0LQxHHBr5BAK19UmxZkyKGd+5Z53LXuEGNNEtjunV4ilOpsTXKSiq6oFa+5uP1BBWD2FF
 m4i5GaMOZSqr0EEc0GJ2VaiyQY9GxnSnQLvbWDb1Z5u4QL1BriBm4Wv34z0jmZE9OgZI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t34KZ-0005xv-Ln for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Oct 2024 02:09:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B74575C3F85;
 Tue, 22 Oct 2024 02:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7E7C4CEC3;
 Tue, 22 Oct 2024 02:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729562937;
 bh=LMXviNltoqXWdqO4iCQaz4PnXyhh7PoIjqWaqIsjCMg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Rl3LyQ5bkrq4S0Nq1aPQyYD9TFNJCZNs/1Fvifz2NiTxQCPqJE5bQPdkhRPNnNHkz
 D0e8UWAToalkq7N5iKsj8Nf/ffKxqKoXFQNqTriAqS0/L59s74SXVJfUBwn62r7yil
 LclvE6TQ4DCIr2PYfj/QOryhzg53vJCYKwXUiET9vlN7bvc43mviWEU8pnHnroIVa7
 ojrP/FmILf8fkkNhSB3PfCUDRmZp4ejPfwQ72f1z/bp6PNIlPXU1CAGI1jntXRF13J
 m/XIVPRL00W+lhKtY6ifd+7eoXDBjABZBge8EG3sYlQ+RqwmHWgiUCU+piKwIdqaup
 FzjNmLiFGTpMw==
Message-ID: <260b8dbd-a2e6-4600-b7bf-4fb1b510476b@kernel.org>
Date: Tue, 22 Oct 2024 10:08:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kernel test robot <lkp@intel.com>, jaegeuk@kernel.org
References: <20241018092200.2792472-1-chao@kernel.org>
 <202410200521.Mc4H4BHm-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202410200521.Mc4H4BHm-lkp@intel.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, Thanks for the report, I rebased this patch on top of
 https://lore.kernel.org/linux-f2fs-devel/20241017012932.1570038-1-chao@kernel.org,
 so there will be dependency in between these two patch. Thanks, 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t34KZ-0005xv-Ln
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to convert log type to segment
 data type correctly
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, oe-kbuild-all@lists.linux.dev
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

Thanks for the report, I rebased this patch on top of
https://lore.kernel.org/linux-f2fs-devel/20241017012932.1570038-1-chao@kernel.org,
so there will be dependency in between these two patch.

Thanks,

On 2024/10/20 5:57, kernel test robot wrote:
> Hi Chao,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on jaegeuk-f2fs/dev-test]
> [also build test ERROR on jaegeuk-f2fs/dev linus/master v6.12-rc3 next-20241018]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Chao-Yu/f2fs-fix-to-convert-log-type-to-segment-data-type-correctly/20241018-172401
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
> patch link:    https://lore.kernel.org/r/20241018092200.2792472-1-chao%40kernel.org
> patch subject: [PATCH] f2fs: fix to convert log type to segment data type correctly
> config: i386-buildonly-randconfig-002-20241019 (https://download.01.org/0day-ci/archive/20241020/202410200521.Mc4H4BHm-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410200521.Mc4H4BHm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410200521.Mc4H4BHm-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>>> fs/f2fs/segment.c:3818:38: warning: declaration of 'enum log_type' will not be visible outside of this function [-Wvisibility]
>      3818 | static int log_type_to_seg_type(enum log_type type)
>           |                                      ^
>>> fs/f2fs/segment.c:3818:47: error: variable has incomplete type 'enum log_type'
>      3818 | static int log_type_to_seg_type(enum log_type type)
>           |                                               ^
>     fs/f2fs/segment.c:3818:38: note: forward declaration of 'enum log_type'
>      3818 | static int log_type_to_seg_type(enum log_type type)
>           |                                      ^
>     fs/f2fs/segment.c:3843:16: error: variable has incomplete type 'enum log_type'
>      3843 |         enum log_type type = __get_segment_type(fio);
>           |                       ^
>     fs/f2fs/segment.c:3843:7: note: forward declaration of 'enum log_type'
>      3843 |         enum log_type type = __get_segment_type(fio);
>           |              ^
>>> fs/f2fs/segment.c:4828:44: error: argument type 'enum log_type' is incomplete
>      4828 |                 array[i].seg_type = log_type_to_seg_type(i);
>           |                                                          ^
>     fs/f2fs/segment.c:3818:38: note: forward declaration of 'enum log_type'
>      3818 | static int log_type_to_seg_type(enum log_type type)
>           |                                      ^
>     1 warning and 3 errors generated.
> 
> 
> vim +3818 fs/f2fs/segment.c
> 
>    3817	
>> 3818	static int log_type_to_seg_type(enum log_type type)
>    3819	{
>    3820		int seg_type = CURSEG_COLD_DATA;
>    3821	
>    3822		switch (type) {
>    3823		case CURSEG_HOT_DATA:
>    3824		case CURSEG_WARM_DATA:
>    3825		case CURSEG_COLD_DATA:
>    3826		case CURSEG_HOT_NODE:
>    3827		case CURSEG_WARM_NODE:
>    3828		case CURSEG_COLD_NODE:
>    3829			seg_type = (int)type;
>    3830			break;
>    3831		case CURSEG_COLD_DATA_PINNED:
>    3832		case CURSEG_ALL_DATA_ATGC:
>    3833			seg_type = CURSEG_COLD_DATA;
>    3834			break;
>    3835		default:
>    3836			break;
>    3837		}
>    3838		return seg_type;
>    3839	}
>    3840	
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
