Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B779E5469D4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jun 2022 17:53:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nzgwj-0006UN-Gk; Fri, 10 Jun 2022 15:53:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sumanthk@linux.ibm.com>) id 1nzgwi-0006UH-Sx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jun 2022 15:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bSQ+sIz8zcajCK1UfAvvK/UqwylTlJURCq9fnVzR47Y=; b=JU8tuwUrqmGVTTuG4XcrZ5Bx9F
 Ob1YhjFn+OlJ3Sdwvf5jC8oVHfH+NRyYkIk4cwCCN+eNsDy/Upay/p9fUB73psDD6IxKIegt42PEt
 CQvP3Lo/b8lD8D45844VMsYJ9vAY90sNx7DRuqxFetOon+tVsKp13iBwAqIIkDYWjcNc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bSQ+sIz8zcajCK1UfAvvK/UqwylTlJURCq9fnVzR47Y=; b=EdJR+EpACtw3ira0qeL2jpEhrO
 fgBRr4I0D/ktSFSqIVuyFkXwMKhbnfsVHs370umqCl9pZhy0go9pqV6vb2oF5Yp26Bc5/nPmov3To
 8hfHsIYmFS3cIqUrnqr2+Wlp8i+xGopsBLNtTTbWyu5Xid8v5V+/g2UNjSKlJqKgnPGU=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nzgwb-00DeYa-Pj
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jun 2022 15:53:11 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AFjJNd032262;
 Fri, 10 Jun 2022 15:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=bSQ+sIz8zcajCK1UfAvvK/UqwylTlJURCq9fnVzR47Y=;
 b=MQwrrzF3bP3vo/h1XqCmKSGgf0E4rXpXkovKys9LUB9VO+gB9iefL84hIUL6LRo2nRmJ
 DRrJuFf+ECQfNZqn9Wt6Mo/uiLK0jQ2h7dDREu/ipMR+uMlYihu1IXGmbd1kFpwazTsP
 kJRZ5kOb9rJqgA0wklYm91kaCNn8ibJzQuvCQYxL9naRKFhGyFtA5Cguf2E8I+GGN9nm
 4/4aYK64kDNI+LQYWLMGQcEYlfy7kSa5eca79a/vqV7PiVdi5PFwXE9xJQ1wYLWHFJ5s
 hPDUEqIvuGpIwXz4yF8YfGbpsrs+vY8oEUW/OylN/TxfiliDdGS07kNt/BRMA+lc2RGx ng== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm6na379a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jun 2022 15:52:49 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25AFo9e9016261;
 Fri, 10 Jun 2022 15:52:47 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3gfy19enwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jun 2022 15:52:47 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25AFqhx318415962
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 15:52:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB7454C046;
 Fri, 10 Jun 2022 15:52:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 797EF4C044;
 Fri, 10 Jun 2022 15:52:43 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 10 Jun 2022 15:52:43 +0000 (GMT)
From: Sumanth Korikkar <sumanthk@linux.ibm.com>
To: willy@infradead.org
Date: Fri, 10 Jun 2022 17:52:05 +0200
Message-Id: <20220610155205.3111213-1-sumanthk@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220605193854.2371230-7-willy@infradead.org>
References: <20220605193854.2371230-7-willy@infradead.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wQqqksoe1OrZQuDk_A2piaIbic5IpPOh
X-Proofpoint-ORIG-GUID: wQqqksoe1OrZQuDk_A2piaIbic5IpPOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=825 clxscore=1011
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100061
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi,
 The kernel crashes with the following backtrace on linux-next:
 [ 203.304451] kernel BUG at fs/inode.c:612! [ 203.304466] invalid opcode:
 0000 [#1] PREEMPT SMP PTI [ 203.305215] CPU: 0 PID: 868 Comm: alloc-instantia
 Not tainted 5.19.0-rc1-next-20220609 #256 [ 203. [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [148.163.158.5 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1nzgwb-00DeYa-Pj
Subject: Re: [f2fs-dev] [PATCH 06/10] hugetlbfs: Convert
 remove_inode_hugepages() to use filemap_get_folios()
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
Cc: linux-nilfs@vger.kernel.org, gor@linux.ibm.com,
 Sumanth Korikkar <sumanthk@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, gerald.schaefer@linux.ibm.com,
 linux-ext4@vger.kernel.org, agordeev@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

The kernel crashes with the following backtrace on linux-next:

[  203.304451] kernel BUG at fs/inode.c:612!
[  203.304466] invalid opcode: 0000 [#1] PREEMPT SMP PTI
[  203.305215] CPU: 0 PID: 868 Comm: alloc-instantia Not tainted 5.19.0-rc1-next-20220609 #256
[  203.305563] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-6.fc35 04/01/2014
[  203.305922] RIP: 0010:clear_inode+0x6e/0x80
[  203.306139] Code: 00 a8 20 74 29 a8 40 75 27 48 8b 93 18 01 00 00 48 8d 83 18 01 00 00 48 39 c2 75 16 48 c7 83 98 00 00 00 60 00 00 00 5b 5d c3 <0f> 0b 0f 0b 0f 0b 0f 0b 0f 0b 0f 1f 84 00 00 00 00 00 0f 1f 44 00
[  203.306827] RSP: 0018:ffffa49dc07cbde8 EFLAGS: 00010002
[  203.307074] RAX: 0000000000000000 RBX: ffff8bf4cecc4010 RCX: 0000000000069600
[  203.307380] RDX: 0000000000000001 RSI: ffffffff929b5b2b RDI: 0000000000000000
[  203.307715] RBP: ffff8bf4cecc4180 R08: 000003fffffffffe R09: ffffffffffffffc0
[  203.307988] R10: ffff8bf4ca515ec8 R11: ffffa49dc07cbc68 R12: ffff8bf4cecc4118
[  203.308256] R13: ffff8bf4cf029a80 R14: ffff8bf4cb2ce900 R15: ffff8bf4c79b8848
[  203.308591] FS:  0000000000000000(0000) GS:ffff8bf533000000(0000) knlGS:0000000000000000
[  203.309033] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  203.309327] CR2: 00007fadbf5d3838 CR3: 000000016520c000 CR4: 00000000000006f0
[  203.309661] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  203.309997] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  203.310330] Call Trace:
[  203.310534]  <TASK>
[  203.310733]  evict+0xc3/0x1c0
[  203.310956]  __dentry_kill+0xd6/0x170
[  203.311196]  dput+0x144/0x2e0
[  203.311416]  __fput+0xdb/0x240
[  203.311634]  task_work_run+0x5c/0x90
[  203.311876]  do_exit+0x317/0xa80
[  203.312104]  do_group_exit+0x2d/0x90
[  203.312337]  __x64_sys_exit_group+0x14/0x20
[  203.312599]  do_syscall_64+0x3b/0x90
[  203.312816]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
[  203.313064] RIP: 0033:0x7fadbf4f2711
[  203.313275] Code: Unable to access opcode bytes at RIP 0x7fadbf4f26e7.
[  203.313559] RSP: 002b:00007fff6b0e0458 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
[  203.313932] RAX: ffffffffffffffda RBX: 00007fadbf5cf9e0 RCX: 00007fadbf4f2711
[  203.314228] RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000000
[  203.314523] RBP: 0000000000000000 R08: ffffffffffffff80 R09: 0000000000000000
[  203.314821] R10: 00007fadbf3dffa8 R11: 0000000000000246 R12: 00007fadbf5cf9e0
[  203.315120] R13: 0000000000000000 R14: 00007fadbf5d4ee8 R15: 00007fadbf5d4f00
[  203.315431]  </TASK>
[  203.315606] Modules linked in: zram zsmalloc xfs libcrc32c
[  203.315875] ---[ end trace 0000000000000000 ]---
[  203.315876] RIP: 0010:clear_inode+0x6e/0x80
[  203.315878] Code: 00 a8 20 74 29 a8 40 75 27 48 8b 93 18 01 00 00 48 8d 83 18 01 00 00 48 39 c2 75 16 48 c7 83 98 00 00 00 60 00 00 00 5b 5d c3 <0f> 0b 0f 0b 0f 0b 0f 0b 0f 0b 0f 1f 84 00 00 00 00 00 0f 1f 44 00
[  203.315879] RSP: 0018:ffffa49dc07cbde8 EFLAGS: 00010002
[  203.315880] RAX: 0000000000000000 RBX: ffff8bf4cecc4010 RCX: 0000000000069600
[  203.315881] RDX: 0000000000000001 RSI: ffffffff929b5b2b RDI: 0000000000000000
[  203.315881] RBP: ffff8bf4cecc4180 R08: 000003fffffffffe R09: ffffffffffffffc0
[  203.315882] R10: ffff8bf4ca515ec8 R11: ffffa49dc07cbc68 R12: ffff8bf4cecc4118
[  203.315883] R13: ffff8bf4cf029a80 R14: ffff8bf4cb2ce900 R15: ffff8bf4c79b8848
[  203.315884] FS:  0000000000000000(0000) GS:ffff8bf533000000(0000) knlGS:0000000000000000
[  203.315886] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  203.315887] CR2: 00007fadbf5d3838 CR3: 000000016520c000 CR4: 00000000000006f0
[  203.315887] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  203.315888] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  203.315889] note: alloc-instantia[868] exited with preempt_count 1
[  203.315890] Fixing recursive fault but reboot is needed!
[  203.315892] BUG: scheduling while atomic: alloc-instantia/868/0x00000000
[  203.315893] Modules linked in: zram zsmalloc xfs libcrc32c
[  203.315894] Preemption disabled at:
[  203.315895] [<0000000000000000>] 0x0
[  203.315896] CPU: 0 PID: 868 Comm: alloc-instantia Tainted: G      D           5.19.0-rc1-next-20220609 #256
[  203.315898] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-6.fc35 04/01/2014
[  203.315898] Call Trace:
[  203.315900]  <TASK>
[  203.315901]  dump_stack_lvl+0x34/0x44
[  203.315905]  __schedule_bug.cold+0x7d/0x8b
[  203.315907]  __schedule+0x624/0x700
[  203.315908]  ? _printk+0x58/0x6f
[  203.315911]  do_task_dead+0x3f/0x50
[  203.315913]  make_task_dead.cold+0x51/0xab
[  203.315914]  rewind_stack_and_make_dead+0x17/0x17
[  203.315917] RIP: 0033:0x7fadbf4f2711
[  203.315918] Code: Unable to access opcode bytes at RIP 0x7fadbf4f26e7.
[  203.315918] RSP: 002b:00007fff6b0e0458 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
[  203.315919] RAX: ffffffffffffffda RBX: 00007fadbf5cf9e0 RCX: 00007fadbf4f2711
[  203.315920] RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000000
[  203.315921] RBP: 0000000000000000 R08: ffffffffffffff80 R09: 0000000000000000
[  203.315921] R10: 00007fadbf3dffa8 R11: 0000000000000246 R12: 00007fadbf5cf9e0
[  203.315922] R13: 0000000000000000 R14: 00007fadbf5d4ee8 R15: 00007fadbf5d4f00
[  203.315924]  </TASK>


* Bisected the crash to this commit.

To reproduce:
* clone libhugetlbfs:
* Execute, PATH=$PATH:"obj64/" LD_LIBRARY_PATH=../obj64/ alloc-instantiate-race shared
 
Crashes on both s390 and x86. 
 
Thanks

--
Sumanth 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
