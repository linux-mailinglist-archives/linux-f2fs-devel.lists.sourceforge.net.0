Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0B98868D0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Mar 2024 10:05:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rnaqR-0007gt-T0;
	Fri, 22 Mar 2024 09:05:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <r.smirnov@omp.ru>) id 1rnaqQ-0007gd-Iw
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 09:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JpJY8nN7ePdbJUAfzWfHTiZULV4nOMaCYCz1s07YbH4=; b=YX5WAdhmmD+mEtIpWKQZZ+OWkU
 rCMNuU8TKvSY/YnDOUC8bYevEgZzbCkC4U7EZRMGYfVpNkaVLy3JYPY+h8ktqtgSlAfzD++5/I77V
 Gy8Qy3rWA5jNIWEmMyDgboW9dTvvQcEFGgbT1lT8oaB0dyf6S7h14BNzXQJqlWMsluvQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JpJY8nN7ePdbJUAfzWfHTiZULV4nOMaCYCz1s07YbH4=; b=m
 4+dMoUIhlXK/qK+F6rj7MGIgtuOyk6HG0qjD8yXKDoH/pDCorYBRbNYrl7eULcFlmIhfnvwy6RbVz
 +YLZ21qQTUd0rjW0Tw3CtJObv77a9qfWlstuM4K7KuEOGWGMVDPDXVO3Xinn11L7zhYOKvRno7NdB
 +bDyC67yn6N0Y3Bk=;
Received: from mx01.omp.ru ([90.154.21.10])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.95) id 1rnaqP-0005IB-TP
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 09:05:47 +0000
Received: from msexch01.omp.ru (10.188.4.12) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 22 Mar
 2024 12:05:32 +0300
Received: from msexch01.omp.ru ([fe80::485b:1c4a:fb7f:c753]) by
 msexch01.omp.ru ([fe80::485b:1c4a:fb7f:c753%5]) with mapi id 15.02.1258.012;
 Fri, 22 Mar 2024 12:05:32 +0300
From: Roman Smirnov <r.smirnov@omp.ru>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>
Thread-Topic: [bug report] fs: f2fs: integer overflow in
 f2fs_truncate_inode_blocks()
Thread-Index: AQHafDfLQelSTjCNm0mAqA97oN6w2Q==
Date: Fri, 22 Mar 2024 09:05:32 +0000
Message-ID: <085b27fd2b364a3c8c3a9ca77363e246@omp.ru>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.188.4.41]
x-kse-serverinfo: msexch01.omp.ru, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 3/22/2024 6:00:00 AM
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: InTheLimit
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello. There is a possible bug in
 f2fs_truncate_inode_blocks():
 if (err < 0 && err != -ENOENT) goto fail; ... offset[1] = 0; offset[0]++;
 nofs += err; 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1rnaqP-0005IB-TP
Subject: [f2fs-dev] [bug report] fs: f2fs: integer overflow in
 f2fs_truncate_inode_blocks()
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
Cc: "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Karina
 Yankevich <k.yankevich@omp.ru>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello. 

There is a possible bug in f2fs_truncate_inode_blocks():

    if (err < 0 && err != -ENOENT)
    			goto fail;
        ...
        offset[1] = 0;
        offset[0]++;
        nofs += err;

If err = -ENOENT then nofs will sum with an error code,
which is strange behaviour. Also if nofs < ENOENT this will
cause an overflow. err will be equal to -ENOENT with the
following call stack:

truncate_nodes()
  f2fs_get_node_page()
     __get_node_page()
        read_node_page()

It looks like ENOENT processing is missing here. What can you
say about it? How can it be fixed?

Found by Linux Verification Center (linuxtesting.org) with the
Svace static analysis tool.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
