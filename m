Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGPkAq/W2GmuiwgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Apr 2026 12:53:35 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE433D5DE0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Apr 2026 12:53:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dl7vRxP+STQtMa6JLvps4JrJOjW3EOjEIGmv5H6sjo4=; b=BpIU9EIDvFnuhqDub1eQQDgNb6
	MZgQ1Bqu+LgOS5GaITi6lTR5DgTB6eXqcX3kn1OYmX4jRXyihsozi66jD3hlG2RFWAlslJu1JDfP7
	SldeFVCAOSDGyuIRcENTqSmS7Jr+YXMvpZKtkLrQy7qyQKPcQzvHo/9PMRKBfLW8WqNE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wB9UN-0004Mx-R6;
	Fri, 10 Apr 2026 10:53:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <xiaosenh@qualcomm.com>) id 1wB9UM-0004Mp-Ki
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Apr 2026 10:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vUyMAU2CwtbhOjRzXPUPUYnkZkkQwX1iYwkPogMh4Y4=; b=BY8h/+jk/+AVvTFA/WeHrIqITk
 wjmf/0PU1tXy+xr6zJbr9LDELCXQQShaFnElAH5Tb8Fh64VBnflDHjptql7v4aslemY12X2kjMxBF
 HnV4CD/2YMTARsDxs/qstzrX+hTIctF19fu76YZS92nuqnYo1dtGHhCyA/dzz66aQrd0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vUyMAU2CwtbhOjRzXPUPUYnkZkkQwX1iYwkPogMh4Y4=; b=MExbsbmhRlQSqNTkmX12vyreyM
 ba+UA/DI87d6OGj3H/lqEINZeoTQN0iPyjeXfmFTocj267nwziYYF/V5DgvqsXdANaYGhwB0kMSCT
 WDh44fHqkdfYC3gEHj/vFn5e86oFVmh0kUPkZ5KN4Zbv7o9Sn74dsBI7897hJ2aKCz0Y=;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wB9UM-0004eJ-0S for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Apr 2026 10:53:26 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63AAd80U2698383; Fri, 10 Apr 2026 10:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=vUyMAU2Cwtb
 hOjRzXPUPUYnkZkkQwX1iYwkPogMh4Y4=; b=KRH1QCgy97IBtRtjN23idF8Lwus
 4p1ZC5WDTtIovzawzrl1cI/Z1861MSlY2/JWSBJ+Gz6W4/aJ0HHGd8tIjdIu/Pek
 odGbdaCFOrLvmtPdXn14qPJRIoRJOiGk6cjL6ehTl307Zom7ezkSVgKqNY9tr/JP
 BT5Ik4Q+TfwyCCIPCDxSdJ3SbTyFLxuxYNaKWbb3APJ23Yrd+BAhXS1RwmvJ5VUH
 fWafWdq20CIK4obdI0GPad/FzgINXvVRpx/NR1sDKs1qXQwA7UkdRauBbK0dcZSC
 a31WmlV3IsXFOex6Y7iK+R4nSlyjqX6CPSuoHtTHcXmQjMKBqVQDc2X58IQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9tu55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Apr 2026 10:53:17 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63AArGnq020320; 
 Fri, 10 Apr 2026 10:53:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4dedvmaej6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Apr 2026 10:53:16 +0000 (GMT)
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63AArGB7020312;
 Fri, 10 Apr 2026 10:53:16 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-xiaosenh-lv.qualcomm.com
 [10.81.27.218])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 63AArGtV020309
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Apr 2026 10:53:16 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4148646)
 id 4B1776C1; Fri, 10 Apr 2026 03:53:16 -0700 (PDT)
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 10 Apr 2026 03:53:11 -0700
Message-Id: <20260410105311.3260515-2-xiaosen.he@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260410105311.3260515-1-xiaosen.he@oss.qualcomm.com>
References: <20260410105311.3260515-1-xiaosen.he@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEwMSBTYWx0ZWRfXxgBigxIQlsWO
 PiHV5vyWQJrB98MV8cXSDqbLUK698BVVEV6Cekn1WcS1Ytx9O3dFUNbj85NwwMlcnNuHuybBSL/
 g0LSRpUKTRjavueaoOlcZ4SDW91zdeOKv2+FkHv46tQ+yDxz5ZR4imEoMdc5MbqLRXjX97i1cWt
 PHgMM5JOeFN87v3VvWWVax0UBrEvLsG5oH6YWYA0wVkfyvYnCvGiZWEQR6FSpATvkrzuMw+nTlY
 rolgt+Xe9T5QSViJQ5O5vQUcX4dIj5X3QUi7DkT9yYhJqQ3My49IwaiOgE9qciG7n1mMIi/AQr8
 ucoJeBsWGps7Dv1TJQfytcjo/7GgRb5uvzux3wk06dXVm8/yBYLD0CYbmvoInpiFWxMerQPjMir
 Jz3WBVKXAH2PbtuXxwq4eImIa6J5eqopAWICbK8yb3XlkV5J0+H6cA0ppTzoscoChmGu7iGoXNM
 x1gH2WgQ/6kDLYdqSzg==
X-Proofpoint-ORIG-GUID: o7DvsyqpX-rggVV68BZK7282RxV4-_kr
X-Proofpoint-GUID: o7DvsyqpX-rggVV68BZK7282RxV4-_kr
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d8d69d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=r2Ui-NX8CWQL2jrR6UsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100101
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  kworker/u32:7(f2fs writeback thread) was trying to acquire
 sbi->writepages, the mutex was already acquired by emulated;0. kworker/u32:7
 tried to flush plugged IO before sleep, during flushing plug lis [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wB9UM-0004eJ-0S
Subject: [f2fs-dev] [PATCH v3 1/1] f2fs: fix deadlock in serializing io
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3BE433D5DE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

kworker/u32:7(f2fs writeback thread) was trying to acquire
sbi->writepages, the mutex was already acquired by emulated;0.
kworker/u32:7 tried to flush plugged IO before sleep, during
flushing plug list, kworker/u32:7 got preempted in RCU read-side
critical section and got scheduled out waiting to be woken up by
the release of mutex. emulated;0 was blocked on blk_mq_get_tag
as there was no available tag and expected the previous IO
requests to be handled by UFS host to release tags, but UFS host
was blocked on synchronize_rcu waiting for ending of RCU grace
period. the deadlock was caused by writeback thread was stuck in
RCU critical section waiting for mutex. call blk_flush_plug() if
mutex_trylock(&sbi->writepages) failed, so that the plug list is
empty when blk_flush_plug() is called in sched_submit_work to
fix the deadlock.

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
index 338df7a2aea6..c8e81f63fe73 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3585,7 +3585,13 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 	}
 
 	if (__should_serialize_io(inode, wbc)) {
+		if (!mutex_trylock(&sbi->writepages))
+			blk_flush_plug(((struct task_struct *)current)->plug, true);
+		else
+			goto set_locked;
+
 		mutex_lock(&sbi->writepages);
+set_locked:
 		locked = true;
 	}
 
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
