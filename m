Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADB76692D4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jan 2023 10:26:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pGGKh-0002Ls-EM;
	Fri, 13 Jan 2023 09:26:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <error27@gmail.com>) id 1pGGKb-0002Ll-Ny
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jan 2023 09:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fBILbsDemyg2wqqLqcvsyl90/r+YyiYMgxhIHYXDi+k=; b=iEswwSoQLUINiXZBKy2f99pP6V
 4W3hvLqTOULfcFkJn4KCfLVs0eVGlFtyhLHJbI67hbIyk65v0oxVUHVWXmaiu8K8t1u24Rlk7+qBz
 jNthpKuUltwHwrtfo5B3VH64j4yn/uaRFIviGez3iZ5JOaNRwTo40VijC3ZME80wzb+w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fBILbsDemyg2wqqLqcvsyl90/r+YyiYMgxhIHYXDi+k=; b=j
 acdrwHRrUAvIlx1EsnljDg/eeKZkT+ljXcqDD7I3GbUrKYNfSFYjzCgBUz9cTDzTePObdrTvsYe8i
 FlaMxiAjStuqlR685w4WtU2Uz5Akel23W/BVm7b49WmyekzWLCIYXSTvmtuHRQTORTzeE1NXWXgpI
 zeiRu90DXeq6d+LY=;
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pGGKa-002HMq-2q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jan 2023 09:26:36 +0000
Received: by mail-wm1-f42.google.com with SMTP id g10so14835782wmo.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Jan 2023 01:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fBILbsDemyg2wqqLqcvsyl90/r+YyiYMgxhIHYXDi+k=;
 b=fDnrLkiFVnWaOqJFi04+e25RZGTzXZNK0Z4tY2UAkZd4pGEcQefkqsc47NF4wdpWYw
 Zee7uHq+v1f5I6Y62wrG3xqc3r1Z96WGNOgC4jFtI4ROY/UFElDrTRWJCx4SdfRcCaWv
 DvgpZMLVR+djCsm7n6wLlQETAlAkYL9xPXRPfixguiGWvoxUqX5gmxBaLibVczdUTPA7
 T17ncV7HaNXzu7WGi6VJf5XvTzT+Axs2+4LsVnDEcPrWk9wFPUaq0xgHtLYKMaJi9/o2
 MNh3jhS1Mg5AxALKIuM2mhIJ7dBDir2o2jJlA+h8FJNmsQ6TKMafLULzsT5k05dJuWmJ
 dXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fBILbsDemyg2wqqLqcvsyl90/r+YyiYMgxhIHYXDi+k=;
 b=m9JAX4trMpSWaKAVqp21AQ1ZqZlwghK1+FZTX7VuDzepUkvmnWirQL1ifGnuNfgFKR
 l0E1SyDXSOqSDZCVCDVoZixrKTi6l1DsLacJ4ggE23Lw0Nc5s0hC80NYEwQKFJ8SokGD
 Gdr5ixIG9HfTSHPTyLQKTLsVhs40P/lyhHN2xv+O6T5AQ9IosKeKp+E4iW/9YSul9feX
 9l8K1MQ3R0I52IBw0b3wlYdKQueiuQ/VNiOPUCRfpdFmWDYEuQCiFpXPcwIlJxfQS8VA
 GB518IZmD5dijAjRlm0Uad4bLgmHz9jpjvARiZgyYn2RQcLEIUmHeHAoKFLZMrOVxVjg
 iTgw==
X-Gm-Message-State: AFqh2koEx5PodMhT5Is6k7DvRwMRykV897ZWv+qXKMyL8TlAEpit5gBH
 4NEgDUH7JVJTbrc3f6Z81YA=
X-Google-Smtp-Source: AMrXdXsGQPd5Vn8PcSQDQSMtm3zkObx3Shco6JYdBVaDiBPsQ8SiSmQKPkhuiBWzKQM7B2/YFy8P0g==
X-Received: by 2002:a05:600c:3b93:b0:3d2:1bf6:5796 with SMTP id
 n19-20020a05600c3b9300b003d21bf65796mr58748727wms.35.1673601989558; 
 Fri, 13 Jan 2023 01:26:29 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b003a6125562e1sm26363824wmq.46.2023.01.13.01.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 01:26:28 -0800 (PST)
Date: Fri, 13 Jan 2023 12:26:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Yangtao Li <frank.li@vivo.com>,
 jaegeuk@kernel.org, chao@kernel.org
Message-ID: <202301131759.qq5Cubxn-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230105042240.24738-1-frank.li@vivo.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Yangtao,
 https://git-scm.com/docs/git-format-patch#_base_tree_information]
 url:
 https://github.com/intel-lab-lkp/linux/commits/Yangtao-Li/f2fs-use-iostat_lat_type-directly-as-a-parameter-in-the-iostat_update_and_unbind_ctx/20230105-122414
 base: https://git.kernel.org/pub/scm [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [error27[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [error27[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.42 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.42 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1pGGKa-002HMq-2q
Subject: Re: [f2fs-dev] [PATCH] f2fs: use iostat_lat_type directly as a
 parameter in the iostat_update_and_unbind_ctx()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 lkp@intel.com, Yangtao Li <frank.li@vivo.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Yangtao,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yangtao-Li/f2fs-use-iostat_lat_type-directly-as-a-parameter-in-the-iostat_update_and_unbind_ctx/20230105-122414
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230105042240.24738-1-frank.li%40vivo.com
patch subject: [PATCH] f2fs: use iostat_lat_type directly as a parameter in the iostat_update_and_unbind_ctx()
config: alpha-randconfig-m041-20230110
compiler: alpha-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
fs/f2fs/iostat.c:228 __update_iostat_latency() error: buffer overflow 'io_lat->sum_lat[type]' 3 <= 3
fs/f2fs/iostat.c:229 __update_iostat_latency() error: buffer overflow 'io_lat->bio_cnt[type]' 3 <= 3
fs/f2fs/iostat.c:230 __update_iostat_latency() error: buffer overflow 'io_lat->peak_lat[type]' 3 <= 3

Old smatch warnings:
fs/f2fs/iostat.c:231 __update_iostat_latency() error: buffer overflow 'io_lat->peak_lat[type]' 3 <= 3

vim +228 fs/f2fs/iostat.c

a4b6817625e71d Daeho Jeong 2021-08-20  211  static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
2804a18e00dbd6 Yangtao Li  2023-01-05  212  				enum iostat_lat_type type)
a4b6817625e71d Daeho Jeong 2021-08-20  213  {
a4b6817625e71d Daeho Jeong 2021-08-20  214  	unsigned long ts_diff;
2804a18e00dbd6 Yangtao Li  2023-01-05  215  	unsigned int page_type = iostat_ctx->type;
a4b6817625e71d Daeho Jeong 2021-08-20  216  	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
a4b6817625e71d Daeho Jeong 2021-08-20  217  	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
61803e984307c7 Daeho Jeong 2022-06-10  218  	unsigned long flags;
a4b6817625e71d Daeho Jeong 2021-08-20  219  
a4b6817625e71d Daeho Jeong 2021-08-20  220  	if (!sbi->iostat_enable)
a4b6817625e71d Daeho Jeong 2021-08-20  221  		return;
a4b6817625e71d Daeho Jeong 2021-08-20  222  
a4b6817625e71d Daeho Jeong 2021-08-20  223  	ts_diff = jiffies - iostat_ctx->submit_ts;
2804a18e00dbd6 Yangtao Li  2023-01-05  224  	if (page_type >= META_FLUSH)
                                                                 ^^^^^^^^^^

2804a18e00dbd6 Yangtao Li  2023-01-05  225  		page_type = META;
a4b6817625e71d Daeho Jeong 2021-08-20  226  
61803e984307c7 Daeho Jeong 2022-06-10  227  	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
2804a18e00dbd6 Yangtao Li  2023-01-05 @228  	io_lat->sum_lat[type][page_type] += ts_diff;
                                                                      ^^^^^^^^^
Mixup between META_FLUSH and NR_PAGE_TYPE leads to memory corruption.

2804a18e00dbd6 Yangtao Li  2023-01-05 @229  	io_lat->bio_cnt[type][page_type]++;
2804a18e00dbd6 Yangtao Li  2023-01-05 @230  	if (ts_diff > io_lat->peak_lat[type][page_type])
2804a18e00dbd6 Yangtao Li  2023-01-05  231  		io_lat->peak_lat[type][page_type] = ts_diff;
61803e984307c7 Daeho Jeong 2022-06-10  232  	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
a4b6817625e71d Daeho Jeong 2021-08-20  233  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
