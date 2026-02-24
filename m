Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCFdMQf/nWkNTAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Feb 2026 20:41:59 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A8118C2B0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Feb 2026 20:41:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DuMXmC9Hnw5jURgSx94V5QXTMqszhjcLshdTF49qKHM=; b=H887ajATpkWEpRZjOJpa4UA/ns
	4dOZYcBUztQj8CcQpumBQP65y3UdEsCqSHDHChj/XQJoCqR29GIfToIN1qmb1hqgx3qjl5KBwa9d8
	GB9TCgSPCjw3ys2/By8t42T6FCE7daSGicnmYn7fJIT7+ZTQKO8WtDtgd7qYy58PhHQI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vuyI3-0006Yj-Cx;
	Tue, 24 Feb 2026 19:41:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dan.carpenter@linaro.org>) id 1vuyI1-0006Yc-N8
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Feb 2026 19:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uG3AIgK7voMXHUPfr4e60Rlgz5PJvFDIhOo0j1uw0Rs=; b=R7lb9Zj3sw0Gu2SAjgocaofYG4
 smANNbFLObF+ghnkIKzKGUqL+P+QXlAT9yHECB3dpwsH60qd46zvLAUnreppotuqECpV1fTOQRDLK
 rKP+8AyoqHlpNpBlGCzrSmeqqNFl1jZK6yCmy319oxNMPu7MaXW0KITb6io7uv+YqCTs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uG3AIgK7voMXHUPfr4e60Rlgz5PJvFDIhOo0j1uw0Rs=; b=k
 3yHjmMWdjvDxKV89WcNmvVlZNARolqB16bF5sGG7MB9mtJLQGnvaZsyUaiaTd/NhGx9o4yTFsLI9Z
 lHpxyh5BEhI+2LJ7n6DKcrWqJca5hqHqEv3fyWrEbkG7Fi4Zi57DXZaqKAGQQ3itDHDpdUWh0fh0+
 t9CpFgiXWpZTKhyU=;
Received: from mail-ej1-f51.google.com ([209.85.218.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vuyI0-0000Mp-Lq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Feb 2026 19:41:49 +0000
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b90bc00578cso284272666b.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Feb 2026 11:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771962097; x=1772566897; darn=lists.sourceforge.net;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uG3AIgK7voMXHUPfr4e60Rlgz5PJvFDIhOo0j1uw0Rs=;
 b=Nxaeff9+K+YilZzfkWE7HESWDxTynRseGMR9XaoGYsRXhXza2N9uP99+giVCTzRDoo
 jw/TBb6nwKD3Xixp+8h/vEQwkj10aMf1v2a9ilCe+ZEfOEHitm2nnPJ/y7gQuFLXp9dR
 0znaA1SzMGQDUiSEoV0Z3zZYtxXHjZ4l78gbcVBgayCgpaNxoYjK4k3jNM+JlbvOzDwt
 OD2e80BYT8STm5VlYZFB7CHFHuVw+xYZulPyQII8b2kbfFqCrq0e4OPM87tJ/0tCJVTA
 U27ixCu3STiynVueEXWpD2cnncyp7GNmCBPt4wVuMdxCvZL/9WPPxNYkV+9tivK7kghb
 PSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771962097; x=1772566897;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uG3AIgK7voMXHUPfr4e60Rlgz5PJvFDIhOo0j1uw0Rs=;
 b=d/aeD9bIj6nqXcp0Tkehn0Uuk/0g2CYKXGJkQA3AASlwvHnQfQ1mXMwbDmvkxuk8lx
 YuyOEkcLaZOZa+cf1jbaSbGSOGW9FiVHeiT8y6AUuhC9BbmrNeD5bXsnPx5i2Qcesr5m
 7cGn1KwM3BDujs7D18nVGYLxWiArohTQ7sxYHm6J1+Qswjhd7pPGnIPNgtFgYCpAYqjM
 Ok4sCek+Ux+Q32BDMxnjp62qU2JWE8IyTBkEmFgEd8OA/h4yf1F7zjxTPvwn9Vqg68Cy
 tUCl8INxGE+L5JvGaPgfDaNG6RLZEl+Ye+WBhabujYXeSircKy2yGfBmAHsI70uG7AJu
 HEQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4sTkiLs0nuVd7VT7ynEUV0x2Mp4eLw97pjVKiybBzN7MoKjHATVH0F1TlEp5IAeTrwYKpw4kF4V0lhOJKYNBz@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzSx9DOYlVI1pE9gcITXm+uvpS5Q+nvonpmMfpwEFKA91+EOcrL
 WmKaR7kuTrZi4CdlbsSaVHChVsTOBJMyQHkxZjDCbNlYZZktj8eKhKvUmm1V6vqD2pzdd2eRo/8
 FHBiM
X-Gm-Gg: ATEYQzzAghL5VQo0tI/6MbAH823pkJtMflYKE840fs8p1DkNQyu1MlVMir5LhydQJVk
 D5XigEmq18ieFY7urLj4ldq9WlMDj1Cm1k2lquAG3WKOcUGVnUrGVcxc/hVO8bd54ub59CxFoAi
 UZZo4rWwr8bUcM20f6/Z84eUNYqJND1w87PvoKJLaMBtpSoTX0HHFj4SYtRKevc51VvM6GeGcne
 zlf6GalCOt2skKSce+EdFezQMyqeszJcV3i0GEZGd/znsPfwyucXCBF5rMNGPH5R9QnX8VvaAah
 n/sGlqxTORF+5obK2MaOQxbkOtcjWfHDkVqCMZlFq7JcecTTOtVPEsqEMAo8rBxAOiiC4yYI4UU
 Au45TG74lRkE0BvrYW5vowsukGrLpLASaVAjcsB3bQ/c/h56fFIaVsnBuNAYY2+KTxLxOLdWQqz
 mHYUjgHRMFnpuVnYZnSUw0CJgWoLyU
X-Received: by 2002:a05:600c:46cd:b0:476:4efc:8ed4 with SMTP id
 5b1f17b1804b1-483a95beff3mr252835335e9.11.1771958470397; 
 Tue, 24 Feb 2026 10:41:10 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d3ff27sm30190203f8f.22.2026.02.24.10.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 10:41:09 -0800 (PST)
Date: Tue, 24 Feb 2026 21:41:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jianan Huang <huangjianan@xiaomi.com>
Message-ID: <202602242237.boCX8y4A-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: 0c3712423755e851debb4021af26802b75d1cb9d commit:
 0c3712423755e851debb4021af26802b75d1cb9d
 [5/5] f2fs: avoid readin [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [196.207.164.177 listed in dnsbl-2.uceprotect.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.51 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vuyI0-0000Mp-Lq
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 5/5] fs/f2fs/gc.c:1286
 ra_data_block() warn: missing error code 'err'
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Sheng Yong <shengyong1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,linaro.org:s=google];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oe-kbuild@lists.linux.dev,m:huangjianan@xiaomi.com,m:jaegeuk@kernel.org,m:shengyong1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,m:lkp@intel.com,m:oe-kbuild-all@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,linaro.org:-];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:email,linaro.org:email]
X-Rspamd-Queue-Id: D0A8118C2B0
X-Rspamd-Action: no action

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   0c3712423755e851debb4021af26802b75d1cb9d
commit: 0c3712423755e851debb4021af26802b75d1cb9d [5/5] f2fs: avoid reading already updated pages during GC
config: csky-randconfig-r071-20260224 (https://download.01.org/0day-ci/archive/20260224/202602242237.boCX8y4A-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602242237.boCX8y4A-lkp@intel.com/

smatch warnings:
fs/f2fs/gc.c:1286 ra_data_block() warn: missing error code 'err'

vim +/err +1286 fs/f2fs/gc.c

6aa58d8ad20a332 Chao Yu                 2018-08-14  1217  static int ra_data_block(struct inode *inode, pgoff_t index)
6aa58d8ad20a332 Chao Yu                 2018-08-14  1218  {
6aa58d8ad20a332 Chao Yu                 2018-08-14  1219  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
f18d00769336897 Sunmin Jeong            2024-07-10  1220  	struct address_space *mapping = f2fs_is_cow_file(inode) ?
f18d00769336897 Sunmin Jeong            2024-07-10  1221  				F2FS_I(inode)->atomic_inode->i_mapping : inode->i_mapping;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1222  	struct dnode_of_data dn;
e0b89d00ea9f846 Chao Yu                 2025-10-14  1223  	struct folio *folio, *efolio;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1224  	struct f2fs_io_info fio = {
6aa58d8ad20a332 Chao Yu                 2018-08-14  1225  		.sbi = sbi,
6aa58d8ad20a332 Chao Yu                 2018-08-14  1226  		.ino = inode->i_ino,
6aa58d8ad20a332 Chao Yu                 2018-08-14  1227  		.type = DATA,
6aa58d8ad20a332 Chao Yu                 2018-08-14  1228  		.temp = COLD,
6aa58d8ad20a332 Chao Yu                 2018-08-14  1229  		.op = REQ_OP_READ,
6aa58d8ad20a332 Chao Yu                 2018-08-14  1230  		.op_flags = 0,
6aa58d8ad20a332 Chao Yu                 2018-08-14  1231  		.encrypted_page = NULL,
2eae077e6e46f90 Chao Yu                 2023-02-02  1232  		.in_list = 0,
6aa58d8ad20a332 Chao Yu                 2018-08-14  1233  	};
0c3712423755e85 Jianan Huang            2026-02-09  1234  	int err = 0;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1235  
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1236) 	folio = f2fs_grab_cache_folio(mapping, index, true);
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1237) 	if (IS_ERR(folio))
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1238) 		return PTR_ERR(folio);
6aa58d8ad20a332 Chao Yu                 2018-08-14  1239  
04a91ab01684744 Christoph Hellwig       2022-11-28  1240  	if (f2fs_lookup_read_extent_cache_block(inode, index,
04a91ab01684744 Christoph Hellwig       2022-11-28  1241  						&dn.data_blkaddr)) {
93770ab7a6e9631 Chao Yu                 2019-04-15  1242  		if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
93770ab7a6e9631 Chao Yu                 2019-04-15  1243  						DATA_GENERIC_ENHANCE_READ))) {
10f966bbf521bb9 Chao Yu                 2019-06-20  1244  			err = -EFSCORRUPTED;
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1245) 			goto put_folio;
93770ab7a6e9631 Chao Yu                 2019-04-15  1246  		}
6aa58d8ad20a332 Chao Yu                 2018-08-14  1247  		goto got_it;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1248  	}
6aa58d8ad20a332 Chao Yu                 2018-08-14  1249  
6aa58d8ad20a332 Chao Yu                 2018-08-14  1250  	set_new_dnode(&dn, inode, NULL, NULL, 0);
6aa58d8ad20a332 Chao Yu                 2018-08-14  1251  	err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
6aa58d8ad20a332 Chao Yu                 2018-08-14  1252  	if (err)
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1253) 		goto put_folio;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1254  	f2fs_put_dnode(&dn);
6aa58d8ad20a332 Chao Yu                 2018-08-14  1255  
93770ab7a6e9631 Chao Yu                 2019-04-15  1256  	if (!__is_valid_data_blkaddr(dn.data_blkaddr)) {
93770ab7a6e9631 Chao Yu                 2019-04-15  1257  		err = -ENOENT;
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1258) 		goto put_folio;
93770ab7a6e9631 Chao Yu                 2019-04-15  1259  	}
6aa58d8ad20a332 Chao Yu                 2018-08-14  1260  	if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
93770ab7a6e9631 Chao Yu                 2019-04-15  1261  						DATA_GENERIC_ENHANCE))) {
10f966bbf521bb9 Chao Yu                 2019-06-20  1262  		err = -EFSCORRUPTED;
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1263) 		goto put_folio;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1264  	}
6aa58d8ad20a332 Chao Yu                 2018-08-14  1265  got_it:
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1266) 	/* read folio */
d342b7adad71e5a Matthew Wilcox (Oracle  2025-07-08  1267) 	fio.folio = folio;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1268  	fio.new_blkaddr = fio.old_blkaddr = dn.data_blkaddr;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1269  
9bf1a3f73927492 Yunlong Song            2018-09-18  1270  	/*
9bf1a3f73927492 Yunlong Song            2018-09-18  1271  	 * don't cache encrypted data into meta inode until previous dirty
9bf1a3f73927492 Yunlong Song            2018-09-18  1272  	 * data were writebacked to avoid racing between GC and flush.
9bf1a3f73927492 Yunlong Song            2018-09-18  1273  	 */
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1274) 	f2fs_folio_wait_writeback(folio, DATA, true, true);
9bf1a3f73927492 Yunlong Song            2018-09-18  1275  
9bf1a3f73927492 Yunlong Song            2018-09-18  1276  	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
9bf1a3f73927492 Yunlong Song            2018-09-18  1277  
e0b89d00ea9f846 Chao Yu                 2025-10-14  1278  	efolio = f2fs_filemap_get_folio(META_MAPPING(sbi), dn.data_blkaddr,
6aa58d8ad20a332 Chao Yu                 2018-08-14  1279  					FGP_LOCK | FGP_CREAT, GFP_NOFS);
e0b89d00ea9f846 Chao Yu                 2025-10-14  1280  	if (IS_ERR(efolio)) {
e0b89d00ea9f846 Chao Yu                 2025-10-14  1281  		err = PTR_ERR(efolio);
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1282) 		goto put_folio;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1283  	}
6aa58d8ad20a332 Chao Yu                 2018-08-14  1284  
0c3712423755e85 Jianan Huang            2026-02-09  1285  	if (folio_test_uptodate(efolio))
0c3712423755e85 Jianan Huang            2026-02-09 @1286  		goto put_encrypted_page;

Is this an error path?  It looks like it is...

0c3712423755e85 Jianan Huang            2026-02-09  1287  
e0b89d00ea9f846 Chao Yu                 2025-10-14  1288  	fio.encrypted_page = &efolio->page;
e0b89d00ea9f846 Chao Yu                 2025-10-14  1289  
6aa58d8ad20a332 Chao Yu                 2018-08-14  1290  	err = f2fs_submit_page_bio(&fio);
6aa58d8ad20a332 Chao Yu                 2018-08-14  1291  	if (err)
6aa58d8ad20a332 Chao Yu                 2018-08-14  1292  		goto put_encrypted_page;
89c16629e3136f0 Yongpeng Yang           2025-10-27  1293  	f2fs_put_page(fio.encrypted_page, false);
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1294) 	f2fs_folio_put(folio, true);
8b83ac81f4283ae Chao Yu                 2020-04-16  1295  
34a23525601a16f Chao Yu                 2022-08-20  1296  	f2fs_update_iostat(sbi, inode, FS_DATA_READ_IO, F2FS_BLKSIZE);
34a23525601a16f Chao Yu                 2022-08-20  1297  	f2fs_update_iostat(sbi, NULL, FS_GDATA_READ_IO, F2FS_BLKSIZE);
8b83ac81f4283ae Chao Yu                 2020-04-16  1298  
6aa58d8ad20a332 Chao Yu                 2018-08-14  1299  	return 0;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1300  put_encrypted_page:
89c16629e3136f0 Yongpeng Yang           2025-10-27  1301  	f2fs_put_page(fio.encrypted_page, true);
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1302) put_folio:
0d53be232343c16 Matthew Wilcox (Oracle  2025-03-31  1303) 	f2fs_folio_put(folio, true);
6aa58d8ad20a332 Chao Yu                 2018-08-14  1304  	return err;
6aa58d8ad20a332 Chao Yu                 2018-08-14  1305  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
