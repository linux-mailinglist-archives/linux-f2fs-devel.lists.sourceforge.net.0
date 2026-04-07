Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED+OO6zd1GnzyAcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 07 Apr 2026 12:34:21 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5023ACEA2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 07 Apr 2026 12:34:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=33+cERl+FwY5vqHpbzuKSyciFZBQUtKbuoFluFIP7Ck=; b=PHOidjsp0axr4RVhxNYFAe8sm6
	+ndm1yZU/yS5eMyYyhS7bTK8glXsAbnP6esOY7weZ6hcO+HYesGub8JSbWZBsGXmfqGM297SozwgR
	W8T21ip8cEW16RrgOR3I3Cd+mtXOMVyYoTAs35mRt1H7fKJmxpvePLLBeI81BfUoA89s=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wA3l1-0004ur-76;
	Tue, 07 Apr 2026 10:34:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <xiaosenh@qualcomm.com>) id 1wA3kz-0004uS-HZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Apr 2026 10:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rGcndIXu0vVD9svxd+QuiW2+IVTZT227uUOvcJQ+W7s=; b=RqdIt0lOxLY1Ukg8tVZH4HcbQW
 +vJD+ZyJOppZ6Ky9uK0QAs0bpirnHT1MbbHhP4G6/zAwcyrtTwtAc/ocXggkhOk5DLLc8n78x6RAq
 9WXbDPGbxx/cA1ql1CusAFRyhQEAJCd4afvU7cycQz/8AlQ1PQ+DWI0NHnqmPqM8ZZ/g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rGcndIXu0vVD9svxd+QuiW2+IVTZT227uUOvcJQ+W7s=; b=Z
 12ufiUlY9ydqr0aENhp+fy0ANKo/o5e60UfC7ivkeb/L/Flggnz6CecXTQdFsdW2Wbx4TUy8/5eRc
 XKZe0HdqmjAHtDDvY8JWGYOK0EECFOU4K3YAM35DbWg+ZE2zrELgo5muWat+fAsRFzXWUCiTKo3BB
 OPusxC2oqG8UseOo=;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wA3ky-0000aN-S4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Apr 2026 10:34:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6376Gkqg2581359; Tue, 7 Apr 2026 10:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=rGcndIXu0vVD9svxd+QuiW2+IVTZT227uUO
 vcJQ+W7s=; b=j2A32RR6qd/VN8gCyga4EqRxnR+Fsl7Or3AWExtBYsEnC8CLvBW
 5Zz4J0QIvFzONmC1AJWA07ZcnRHvCf5R/fak40WJE4Gu1o50tH7T1kA5BaYcGmbo
 8ojA/jeWy0jpHZOhikc6AC5YK0/5caxIT2DACLjW/Qo0W28hCIKfdOK5Y+CvcrOV
 GPJB7h913SNN2u3z4/EkduVFFWlxoeiB24/nohGFCtslvIaSUU7EsAG7C9HQ3XRk
 reLFNll/r9xpmfABEdpbdYSjMpatWGNJoY9CpeGdJGenkAG4OTzyuwxh84x5Gx+J
 boRBTdEw8zelsSNpJF2RgNeh7AL0Npa3z8A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf274k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2026 10:03:46 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 637A3jmZ005311; 
 Tue, 7 Apr 2026 10:03:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 4dcngexmw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2026 10:03:45 +0000 (GMT)
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 637A24cA002714;
 Tue, 7 Apr 2026 10:03:45 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-xiaosenh-lv.qualcomm.com
 [10.81.27.218])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 637A3jKr005301
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2026 10:03:45 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4148646)
 id 0DE2969D; Tue,  7 Apr 2026 03:03:45 -0700 (PDT)
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  7 Apr 2026 03:03:41 -0700
Message-Id: <20260407100341.3319002-1-xiaosen.he@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4OSBTYWx0ZWRfX3+LRcCZDKWRr
 p3Ew9/rqprETc9nbrnw3y9xC3dZy+6W15MY8WvDzcjP3Ra6pQBpGgweX9IH28ttyTzZ9pdgFGgQ
 Wd0SXQFn3P+jnjsVKofkZcgDkGSaa//Cv0eDJpee3DuL6j9BUFws+fy/9vC4XkxPBEFnCL8/QMZ
 mj02SvzM5U55g6faPXoTSiYOwulWsl5YM5d2RXdUD88JEbgiAyKlwLh26kQ/yPEww3SnL0mUp5W
 DmwH6qEi2qckGFFr+FvIdUDw+ILPNaTZHINIcMnSRXtXA/ZXuRthupI2EnPKveAxtW5fAWQli4p
 pVOYzmaZjCOw+IssRJA+YIIrj4UVVX98nzE98p/wt+wxqJ2TNYAzE9zKPI0YzZyOYj8xTmmide+
 xDoQFYrRv6tm3IeG6FXArYsTtFZcKPF5ygkyt5I4/AbW/VSjfZB0qW0TPDDIJja9HezNc7sx1jf
 7bpDaM9C/8yeFxUVhdA==
X-Proofpoint-ORIG-GUID: nuojLPAYpSfTQDbU8DUaHboknwcHEjU8
X-Proofpoint-GUID: nuojLPAYpSfTQDbU8DUaHboknwcHEjU8
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d4d682 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=HbQX25L281hq7F_i29sA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070089
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  kworker/u32:7 was trying to acquire sbi->writepages,
 the mutex
 was already acquired by emulated;0, kworker/u32:7 tried to flush plugged
 IO before sleep, during flushing plug list, kworker/u32:7 got pr [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wA3ky-0000aN-S4
Subject: [f2fs-dev] [PATCH] f2fs: fix deadlock in serializing io
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
From: Xiaosen He via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Xiaosen He <xiaosen.he@oss.qualcomm.com>
Cc: can.guo@oss.qualcomm.com, xiaosen.he@oss.qualcomm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:can.guo@oss.qualcomm.com,m:xiaosen.he@oss.qualcomm.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,qualcomm.com:s=qcppdkim1];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,qualcomm.com:-];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[xiaosen.he@oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:mid,qualcomm.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3A5023ACEA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

kworker/u32:7 was trying to acquire sbi->writepages, the mutex
was already acquired by emulated;0, kworker/u32:7 tried to
flush plugged IO before sleep, during flushing plug list,
kworker/u32:7 got preempted in RCU read-side critical section
and got scheduled out to be in uninterruptible sleep. emulated;0
was blocked on blk_mq_get_tag as there is no available tags and
expected the previous IO requests to be handled by UFS host, but
UFS host was blocked on synchronize_rcu waiting for ending of RCU
grace period. Do not serialize io when writeback thread is in
progress to fix the deadlock.

    Task name: kworker/u32:7    [affinity: 0xff] pid:    233 tgid:    233 cpu: 6 prio: 98 start: 0xffffff8099390040
    state: 0x2[D] exit_state: 0x0 stack base: 0xffffffc083c48000
    Last_enqueued_ts:     390.169395877 Last_sleep_ts:     389.756639574
    Stack:
    [<ffffffd3a0b1d254>] __switch_to+0x214
    [<ffffffd3a0b1deb8>] __schedule+0xa30
    [<ffffffd3a0b1e754>] preempt_schedule_notrace+0x68
    [<ffffffd39f9ddf38>] rcu_is_watching[jt]+0x5c
    [<ffffffd39f9995b8>] lock_acquire+0x68
    [<ffffffd39ffe870c>] rcu_lock_acquire+0x34
    [<ffffffd39ffe8764>] percpu_ref_put_many+0x20
    [<ffffffd39ffe3a64>] blk_mq_dispatch_list+0x570
    [<ffffffd39ffe3264>] blk_mq_flush_plug_list+0x13c
    [<ffffffd39ffd43a8>] __blk_flush_plug+0x11c
    [<ffffffd39f93e6c4>] sched_submit_work+0x78
    [<ffffffd3a0b1e4d8>] schedule+0x38
    [<ffffffd3a0b1e5c4>] schedule_preempt_disabled+0x18
    [<ffffffd3a0b20c7c>] __mutex_lock_common+0xab8
    [<ffffffd3a0b20084>] mutex_lock_nested+0x2c
    [<ffffffd39feea72c>] f2fs_write_data_pages+0xd64
    [<ffffffd39fbb3958>] do_writepages+0xd4
    [<ffffffd39fd09fd8>] __writeback_single_inode+0x78
    [<ffffffd39fd09958>] writeback_sb_inodes+0x2b8
    [<ffffffd39fd09cc0>] __writeback_inodes_wb+0xa0
    [<ffffffd39fd09054>] wb_writeback+0x188
    [<ffffffd39fd066d0>] wb_workfn[jt]+0x438
    [<ffffffd39f9198e0>] process_one_work+0x27c
    [<ffffffd39f91baf8>] worker_thread+0x358
    [<ffffffd39f924534>] kthread+0x150
    [<ffffffd39f830e44>] ret_from_fork+0x10

    Task name: kworker/u32:2    [affinity: 0xff] pid:     90 tgid:     90 cpu: 1 prio: 120 start: 0xffffff80adae8040
    state: 0x2[D] exit_state: 0x0 stack base: 0xffffffc080a18000
    Last_enqueued_ts:     389.899608637 Last_sleep_ts:     389.899665303
    Stack:
    [<ffffffd3a0b1d254>] __switch_to+0x214
    [<ffffffd3a0b1deb8>] __schedule+0xa30
    [<ffffffd3a0b1e4e8>] schedule+0x48
    [<ffffffd39f9dfa64>] synchronize_rcu_expedited+0x928
    [<ffffffd39f9deeb0>] synchronize_rcu[jt]+0x234
    [<ffffffd39ffde5d4>] blk_mq_quiesce_tagset[jt]+0xa8
    [<ffffffd3a061cd90>] ufshcd_devfreq_scale+0x90
    [<ffffffd3a061ca6c>] ufshcd_devfreq_target+0x204
    [<ffffffd3a06de244>] devfreq_set_target+0xb8
    [<ffffffd3a06de14c>] devfreq_update_target[jt]+0xd8
    [<ffffffd3a06de5e8>] devfreq_monitor+0x38
    [<ffffffd39f9198e0>] process_one_work+0x27c
    [<ffffffd39f91baf8>] worker_thread+0x358
    [<ffffffd39f924534>] kthread+0x150
    [<ffffffd39f830e44>] ret_from_fork+0x10

    Task name: emulated;0       [affinity: 0xff] pid:   5245 tgid:   4922 cpu: 6 prio: 120 start: 0xffffff89e2e60040
    state: 0x2[D] exit_state: 0x0 stack base: 0xffffffc0d42f8000
    Last_enqueued_ts:     390.169395877 Last_sleep_ts:     390.178459731
    Stack:
    [<ffffffd3a0b1d254>] __switch_to+0x214
    [<ffffffd3a0b1deb8>] __schedule+0xa30
    [<ffffffd3a0b1e4e8>] schedule+0x48
    [<ffffffd3a0b1e8f4>] io_schedule+0x38
    [<ffffffd39ffeb110>] blk_mq_get_tag+0x1a4
    [<ffffffd39ffdedc8>] __blk_mq_alloc_requests+0x358
    [<ffffffd39ffe409c>] blk_mq_submit_bio+0x50c
    [<ffffffd39ffd4cb8>] __submit_bio[jt]+0x164
    [<ffffffd39ffd2e7c>] submit_bio_noacct_nocheck+0x14c
    [<ffffffd39ffd3394>] submit_bio_noacct+0x330
    [<ffffffd39ffd3814>] submit_bio+0x1f4
    [<ffffffd39fee2ba8>] f2fs_submit_write_bio+0x88
    [<ffffffd39fee413c>] __submit_merged_bio[jt]+0xbc
    [<ffffffd39fee3c4c>] f2fs_submit_page_write+0x400
    [<ffffffd39ff04aac>] do_write_page+0x180
    [<ffffffd39ff04ca0>] f2fs_outplace_write_data+0x78
    [<ffffffd39fee88d4>] f2fs_do_write_data_page+0x390
    [<ffffffd39fee8df0>] f2fs_write_single_data_page+0x1e0
    [<ffffffd39feea288>] f2fs_write_data_pages+0x8c0
    [<ffffffd39fbb3958>] do_writepages+0xd4
    [<ffffffd39fba153c>] __filemap_fdatawrite_range+0x94
    [<ffffffd39fbb0370>] generic_fadvise+0x1d8
    [<ffffffd39feabaa0>] f2fs_file_fadvise+0x124
    [<ffffffd39fbb0570>] __arm64_sys_fadvise64_64+0x70
    [<ffffffd39f847e7c>] invoke_syscall+0x58
    [<ffffffd39f847da4>] el0_svc_common[jt]+0xb8
    [<ffffffd39f847d18>] do_el0_svc+0x1c
    [<ffffffd3a0b14fac>] el0_svc+0x40
    [<ffffffd3a0b14ef8>] el0t_64_sync_handler[jt]+0xd0
    [<ffffffd39f8116a0>] ret_to_user[jt]+0x0

Signed-off-by: Xiaosen He <xiaosen.he@oss.qualcomm.com>
---
 fs/f2fs/data.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 338df7a2aea6..0912190a15e9 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3501,6 +3501,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 static inline bool __should_serialize_io(struct inode *inode,
 					struct writeback_control *wbc)
 {
+	struct bdi_writeback wb = inode->i_sb->s_bdi->wb;
+
+	/* to avoid deadlock in path of wb_writeback and __filemap_fdatawrite_range*/
+	if (writeback_in_progress(&wb))
+		return false;
+
 	/* to avoid deadlock in path of data flush */
 	if (F2FS_I(inode)->wb_task)
 		return false;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
