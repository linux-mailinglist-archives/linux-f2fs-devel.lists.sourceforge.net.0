Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EChcAtnN2GngiQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Apr 2026 12:15:53 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4E93D5862
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Apr 2026 12:15:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uAHTciYVf8HFvouUJBHSzFA+qxDdGe7Icd4J/cWMV7k=; b=QOTljRgV56a5IqeWNXdq//M+QY
	6ZYTBvlPQFr+7O8yAzeIQsQF/Jk1OASs2rT85c0IM4xjvmP/T21anjeHJC8Iy9Cd8FbslRiRWf3Vn
	GGVlxPf9lfPMbfGMWBhy5LLtVvMkk2q1WVLQ6p5pB2GMAOejoh6Mad+96jm/W+Oyl0rU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wB8tq-0001V3-9W;
	Fri, 10 Apr 2026 10:15:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <error27@gmail.com>) id 1wB8tc-0001U7-3P
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Apr 2026 10:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZfgI2pXUOHZS6ZdVdKu3ZMeMeuPIis+Wn+AZheOGMYQ=; b=lZeWh/a/g36jViQZMmNtv4Cv4C
 9qnHbAYCOBshi0cm9ChZhvRWIrdCXgZyGxWwOQ9N6rRxYjwxm+pdwobeR6Co9+pswG/DhaLgGn2T9
 5gpX/o3533FlTiUqBe3A0wzcd57wlwv8D+HrY5/n/LCgtiv7ZOYXNflCVLZZnjGAf7NE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZfgI2pXUOHZS6ZdVdKu3ZMeMeuPIis+Wn+AZheOGMYQ=; b=h
 TdrzCUEsyPtQcpAG4JSf1ptP/ePq1rJKFkP+yA4rEhdyfXmW7yQM6gd5LPUWgEp32RFJ0m8OCiPcS
 h0H/hCK/i3oZYanj57Ag3T36ijWW9WIr+HsadNdX68au1OiWCZiRAs16TDxzPgstkuAbqX1U8C05X
 BHWhV2TB0sBOff5s=;
Received: from mail-wr1-f49.google.com ([209.85.221.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wB8tb-0002Ki-Lp for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Apr 2026 10:15:28 +0000
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43cfb723698so1386954f8f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Apr 2026 03:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775816116; x=1776420916; darn=lists.sourceforge.net;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZfgI2pXUOHZS6ZdVdKu3ZMeMeuPIis+Wn+AZheOGMYQ=;
 b=QVraV+piZERnnnr/NPU2mx4T5baqrLwbbLlqWMgDmv9nseflwiegZ7bTFLVvxRuXES
 TUXIFgcMjDTaUwG/0uOD1CTmQIIejAfQG/YFvBT548ZWUOGFvQTcVk2ZDT24oCfIyfIX
 MVrWkhLfs2oHDuMA94fDAjjlq5GPBJqEPMFFcb+/eX08FbFeS8fwd328RZvnVTdHzzPO
 ygjx++pviRQe/QM6ECDkdX3hivaVDI5weyA9dskILpOVW+Q/34PkKequc/7nfdDr8je5
 HuQnLl3lYqVoHTYyUEHWbAUvCbTPH4FRl3HWKOi7SDS/d2L8H0KSVUxdst5XQg5Diy6W
 zakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775816116; x=1776420916;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZfgI2pXUOHZS6ZdVdKu3ZMeMeuPIis+Wn+AZheOGMYQ=;
 b=AoChYacqebf5dWGwbLabAEjAOFHcLzXrexqooOdtdMjlhdnsMI2VkbfZL+tafA4JzG
 xad+X9nkBdcOqOU6157i9p56fAd9MyTi6f9iM2fjV44JcCT+nksyzTV2UF/rGwY5syJG
 EmwFpfQ1cG5fNEjDys6ls8Ad3D6uQFKCgPw1c+IC7mSO295WbkroBWkBbMvLZlNvxLZ5
 mqrWvL0d8y6waJf8sMWEBDNjZyFLuoqVarR2TYEdGmND8EtzOUX66BHzBX551slpZIE2
 P2hGO6Ikor96xFOVWKQjCjzl2wOQPwkxvNKW5/41hu0NTgnskjvQ0VvHrXEUrzkRA4Ce
 4QTQ==
X-Gm-Message-State: AOJu0YxH32k92SOPFs6L/zZEdgsbfSiNajfQK2kSrMyRNqZaE7HzuWDV
 adQkAW/JxVvKq3PWJk9HYBfSRiBF/iDKCsBxEGcGx+oaW42axASulLtI
X-Gm-Gg: AeBDietsOZTv/+6YQqj+gWIieqTV9vxfL6YVWKbPPhdB9oxC69CoBUe7S1gfX6u0Hvd
 tAw9nBapaavC4JOte5BCws8FNYZ/I+nfBUJtiRYq33LfsSAfVQXh3rx8VwK8JAvDIbCuTX4/CWY
 yqxFN+6zUGcgLwWlHWYX0c6T5GJ3ztszNzKqqKSpdpVzS1e8OpQVAgw5VIl5mt23Bhs6FM+IonE
 zc3vM32aDBQaWizpfYbUI9fEUlkzEQuQQlgQaq+QYRsSrBdT5oPqYwDPGdcttUlYtFuO4VHL8zN
 ifgSiuHOIFyiFRfpL0JGeR2dEhHUGX1v8ZcBRGzscOGfSDJoVJbBHK0xS1Hqr0sfEl15+ENUr7F
 F2M3fDNmSuQLkqwfRXO4exuUYcQ1qKHzv6I6HPRrJlS0G4xUyMYErH+Bt3dqUrmNgoSzZL8egkX
 jPvpC+idBVjH9YGgS2usw=
X-Received: by 2002:a5d:584c:0:b0:43d:394a:476d with SMTP id
 ffacd0b85a97d-43d642979a1mr3956182f8f.2.1775816115989; 
 Fri, 10 Apr 2026 03:15:15 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e46881sm6676099f8f.23.2026.04.10.03.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 03:15:15 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:15:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jianan Huang <huangjianan@xiaomi.com>
Message-ID: <adjNsFjxdTpsOR_K@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: 2.1 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello Jianan Huang, Commit 570e2ccc7cb3 ("f2fs: avoid reading
 already updated pages during GC") from Mar 5, 2026 (linux-next), leads to
 the following Smatch static checker warning: fs/f2fs/gc.c:1291 ra_data_block()
 warn: missing error code 'err' 
 Content analysis details:   (2.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [196.207.164.177 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [error27(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [error27(at)gmail.com]
 1.0 FORGED_GMAIL_RCVD 'From' gmail.com does not match 'Received' headers
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.49 listed in wl.mailspike.net]
X-Headers-End: 1wB8tb-0002Ki-Lp
Subject: [f2fs-dev] [bug report] f2fs: avoid reading already updated pages
 during GC
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:huangjianan@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid]
X-Rspamd-Queue-Id: 3E4E93D5862
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Jianan Huang,

Commit 570e2ccc7cb3 ("f2fs: avoid reading already updated pages
during GC") from Mar 5, 2026 (linux-next), leads to the following
Smatch static checker warning:

	fs/f2fs/gc.c:1291 ra_data_block()
	warn: missing error code 'err'

fs/f2fs/gc.c
    1220 static int ra_data_block(struct inode *inode, pgoff_t index)
    1221 {
    1222         struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
    1223         struct address_space *mapping = f2fs_is_cow_file(inode) ?
    1224                                 F2FS_I(inode)->atomic_inode->i_mapping : inode->i_mapping;
    1225         struct dnode_of_data dn;
    1226         struct folio *folio, *efolio;
    1227         struct f2fs_io_info fio = {
    1228                 .sbi = sbi,
    1229                 .ino = inode->i_ino,
    1230                 .type = DATA,
    1231                 .temp = COLD,
    1232                 .op = REQ_OP_READ,
    1233                 .op_flags = 0,
    1234                 .encrypted_page = NULL,
    1235                 .in_list = 0,
    1236         };
    1237         int err = 0;
    1238 
    1239         folio = f2fs_grab_cache_folio(mapping, index, true);
    1240         if (IS_ERR(folio))
    1241                 return PTR_ERR(folio);
    1242 
    1243         if (f2fs_lookup_read_extent_cache_block(inode, index,
    1244                                                 &dn.data_blkaddr)) {
    1245                 if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
    1246                                                 DATA_GENERIC_ENHANCE_READ))) {
    1247                         err = -EFSCORRUPTED;
    1248                         goto put_folio;
    1249                 }
    1250                 goto got_it;
    1251         }
    1252 
    1253         set_new_dnode(&dn, inode, NULL, NULL, 0);
    1254         err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
    1255         if (err)
    1256                 goto put_folio;
    1257         f2fs_put_dnode(&dn);
    1258 
    1259         if (!__is_valid_data_blkaddr(dn.data_blkaddr)) {
    1260                 err = -ENOENT;
    1261                 goto put_folio;
    1262         }
    1263         if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
    1264                                                 DATA_GENERIC_ENHANCE))) {
    1265                 err = -EFSCORRUPTED;
    1266                 goto put_folio;
    1267         }
    1268 got_it:
    1269         /* read folio */
    1270         fio.folio = folio;
    1271         fio.new_blkaddr = fio.old_blkaddr = dn.data_blkaddr;
    1272 
    1273         /*
    1274          * don't cache encrypted data into meta inode until previous dirty
    1275          * data were writebacked to avoid racing between GC and flush.
    1276          */
    1277         f2fs_folio_wait_writeback(folio, DATA, true, true);
    1278 
    1279         f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
    1280 
    1281         efolio = f2fs_filemap_get_folio(META_MAPPING(sbi), dn.data_blkaddr,
    1282                                         FGP_LOCK | FGP_CREAT, GFP_NOFS);
    1283         if (IS_ERR(efolio)) {
    1284                 err = PTR_ERR(efolio);
    1285                 goto put_folio;
    1286         }
    1287 
    1288         fio.encrypted_page = &efolio->page;
    1289 
    1290         if (folio_test_uptodate(efolio))
--> 1291                 goto put_encrypted_page;

Should we set an error code here?

    1292 
    1293         err = f2fs_submit_page_bio(&fio);
    1294         if (err)
    1295                 goto put_encrypted_page;
    1296         f2fs_put_page(fio.encrypted_page, false);
    1297         f2fs_folio_put(folio, true);
    1298 
    1299         f2fs_update_iostat(sbi, inode, FS_DATA_READ_IO, F2FS_BLKSIZE);
    1300         f2fs_update_iostat(sbi, NULL, FS_GDATA_READ_IO, F2FS_BLKSIZE);
    1301 
    1302         return 0;
    1303 put_encrypted_page:
    1304         f2fs_put_page(fio.encrypted_page, true);
    1305 put_folio:
    1306         f2fs_folio_put(folio, true);
    1307         return err;
    1308 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
