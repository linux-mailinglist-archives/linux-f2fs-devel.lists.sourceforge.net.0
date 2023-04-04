Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D44186D6A04
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 19:14:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjkEn-0001Tn-Ug;
	Tue, 04 Apr 2023 17:14:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@kernel.org>) id 1pjkEn-0001Th-1S
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 17:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q0SEd99SwGnQv2q9V/VBWUZ22Egdd8W2yS7XP6MsaXY=; b=By5qanpCkSdvfp3qlfMyej+4oD
 RLuT2H/Sfo31bt0xtuTjUR7f9y+UGrv+nzTpuITTaotI2NFdrxUpBrzAU/sCqnwC9M/kpS3LQTh3g
 E7FP4b8pubw+vzFdBwod2T1TSgBfzgP/aAIWtG8KxhNjC6EzHf9z5gYxGYTRpIQOn26c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=q0SEd99SwGnQv2q9V/VBWUZ22Egdd8W2yS7XP6MsaXY=; b=e
 dDvydnzQ89khJdBP8etVRkAcTZRT1Gz2CK5f/ucL6HExuEf7QhNVYyocpniCHvmaJhsl1m+/STelu
 NOQYoXS5xTUYrTjUXOsrCzI28LPWeTh4YFhF+3Xn/DzfyVlqv0BiH8zmUSxlvvhFgZiRm98Exr5u4
 +cqYbCwUSEQKrxrY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjkEn-00F8IW-5L for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 17:14:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C13DE63788;
 Tue,  4 Apr 2023 17:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327B4C433EF;
 Tue,  4 Apr 2023 17:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680628461;
 bh=q0SEd99SwGnQv2q9V/VBWUZ22Egdd8W2yS7XP6MsaXY=;
 h=From:To:Cc:Subject:Date:From;
 b=rxf8Px/sRI8aDXXpPLhlzWA7uWbh8KlGWQty8kES5RT+P2cE0UZXEEk7kk3dpox6G
 4U3EzithdvlX5dCrUpSuB8HxmQk1UaHJEeMPlD9GBQxvV6kJhHp1/7vG5wwQFgAujZ
 8J2/JqrepCiN9l+GM1AFR4ph4XOMpfXEG9CaXA3eunj96pT3CF7kxt4gFWVmW49cI2
 yBQzPqBiSeQeLQ0bnDeJnllu9cv1Gd9xjYPac0pm7TEd3B3phZewlywDchtaA8Wmc2
 kyj4IPnK8suH6Z4FcqGxNK4kuoJegBuoeAE7HuJeTE+DUK0ijwELoh8zHTxKF51NPy
 ZZTcI9PosiYyg==
From: Zorro Lang <zlang@kernel.org>
To: fstests@vger.kernel.org
Date: Wed,  5 Apr 2023 01:14:06 +0800
Message-Id: <20230404171411.699655-1-zlang@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  I think I might be mad to include that many mailing lists
 in this patchset... As I explained in [PATCH 1/5], fstests covers more and
 more fs testing thing, so we always get help from fs specific mailing list,
 due to they learn about their features and bugs more. Besides that, s [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjkEn-00F8IW-5L
Subject: [f2fs-dev] [RFC PATCH 0/5] fstests specific MAINTAINERS file
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
Cc: brauner@kernel.org, linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 ebiggers@google.com, djwong@kernel.org, amir73il@gmail.com,
 linux-unionfs@vger.kernel.org, anand.jain@oracle.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 fdmanana@suse.com, ocfs2-devel@oss.oracle.com, jack@suse.com,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I think I might be mad to include that many mailing lists in this patchset...

As I explained in [PATCH 1/5], fstests covers more and more fs testing
thing, so we always get help from fs specific mailing list, due to they
learn about their features and bugs more. Besides that, some folks help
to review patches (relevant with them) more often. So I'd like to bring
in the similar way of linux/MAINTAINERS, records fs relevant mailing lists,
reviewers or supporters (or call co-maintainers). To recognize the
contribution from them, and help more users to know who or what mailing list
can be added in CC list of a patch.

(The MAINTAINERS and get_maintainer.pl are copied from linux project,
then I made some changes for fstests specially.)

PATCH 3~5 are still under reviewing, hasn't been decided...

About [3/5], if someone mailing list doesn't want to be in cc list of related
fstests patch, please clarify, I'll remove.

About [4/5], if someone people doesn't want to be CCed, tell me, I'll remove.

About [5/5], need more reviewing from btrfs list.

If others fs which *always send patches to fstests@* and *hope to have a specific
co-maintainer* who can help more on your patches (to fststs) before merging, refer
to [5/5].

Thanks,
Zorro


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
