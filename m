Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A1DC2A81A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 03 Nov 2025 09:12:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btkrwQQXCrbbqEwiYAL4UY5rK4V8S9ms77pqBSPZakE=; b=POyjygZt8cjATUyv7oskRLWN3W
	rjpwIH9oo76LpttvFLvLK15bYvnATMYj18WYxxQBiv+Mab6Q7WIWkv4NFtkZgvLgyExnPNwItInfE
	VaogKDMNXx7QDFRWwSYBgneDBuiwu8XfBc8AZzEtS9fRC2g9V7wAA1wEh1D4PJ2wpNYw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFpfz-0000hi-SJ;
	Mon, 03 Nov 2025 08:12:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vFpfy-0000hb-Dn
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 08:12:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cyUEvbOv0P9g2VS0Ik/7ZyAKlx0V4bkPm8u7c2IpSyo=; b=XTqDaw+ufpm15MTjQkeNxhH5Cm
 nUbTkgtIvDy/u3/H0bAIRcxMH0l/6/SYuoBEH4A6B/GjS+5+bhNeEUCgInJXkp+Xmxx1ieXb5NlbY
 +WIISOXKVhlwikwOSoo3nw3gS8Yr9Rh4Jfg1DaRRGLbLCS7rAW7TRvDk42TCcpRJed40=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cyUEvbOv0P9g2VS0Ik/7ZyAKlx0V4bkPm8u7c2IpSyo=; b=eP5XfYMgmpxjFFYUIWPwRewD1b
 RbjKKMrBBE8KCV9qNskSC7ZeQohlo/Lya1NaujkrWVDz2SokaGsbQVvmCUAmeowEYhANOKPUJi0KF
 Akb2dAhx3IRi3y4s1V6DSEvEhvLRWeMFdN8feYvuGAurYswQF2lPqWMdasSgrbsJsFUc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vFpfx-0006mc-SU for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 08:12:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7BAE04081A;
 Mon,  3 Nov 2025 08:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D6AC4CEE7;
 Mon,  3 Nov 2025 08:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762157539;
 bh=IvpnIGpW5pDCkLQfXgWwGHkEHfCk7MiqPLCNiRLC+WQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=S0YNXVS0yAj8eMy8n4ZhbtQ9hC9T7Mf54lpwHTVpoKAAqh3V3nd+ZzZVWHv1SV+W5
 UAd3gtBHUvErsl25wSglSV94+e8eDBDB8+xMxyHLV58f0Sqe6lPn/TWLtxh6scepw4
 q1spY+AuYY/hk7wOUS7giLwwNUxKshkly3d98vZcRt5zCD8YKe0Uuttbl/D5MsOzbi
 m7k5AUlzhk2nB/mr+GfQBTZnFtjo5imn3No8h0N+RqcIbXSniKdUZO5aitu2TIC4Pn
 8uCvFmJpzDoQRIseKnwWF1P6pLD5ClaNqTQC1KpNUhsTxWbg3yaBpYQf1kguBZhJa1
 7oUS76waCD/vQ==
Message-ID: <1f519357-a489-41fe-8159-a8e319aedd17@kernel.org>
Date: Mon, 3 Nov 2025 16:12:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
References: <cover.1761993022.git.zlatistiv@gmail.com>
 <55522ef8f3424e563ff18a720c709dcb065091af.1761993022.git.zlatistiv@gmail.com>
 <ea38e464-a28a-4b06-8046-5b62f7172875@kernel.org>
 <pcxf66ac2yjkqyvhb6xgbk6jiihcejuncgbblkewz6rs7i5uzt@m6yjin7t67is>
Content-Language: en-US
In-Reply-To: <pcxf66ac2yjkqyvhb6xgbk6jiihcejuncgbblkewz6rs7i5uzt@m6yjin7t67is>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/3/25 15:55, Nikola Z. Ivanov wrote: > On Mon, Nov 03, 
 2025 at 10:35:17AM +0800, Chao Yu wrote: >> On 11/1/25 20:56, Nikola Z. Ivanov
 wrote: >>> Add check for inode->i_nlink == 1 for directories [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vFpfx-0006mc-SU
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: Add sanity checks before
 unlinking and loading inodes
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
Cc: david.hunter.linux@gmail.com,
 syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 khalid@kernel.org, skhan@linuxfoundation.org, jaegeuk@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/3/25 15:55, Nikola Z. Ivanov wrote:
> On Mon, Nov 03, 2025 at 10:35:17AM +0800, Chao Yu wrote:
>> On 11/1/25 20:56, Nikola Z. Ivanov wrote:
>>> Add check for inode->i_nlink == 1 for directories during unlink,
>>> as their value is decremented twice, which can trigger a warning in
>>> drop_nlink. In such case mark the filesystem as corrupted and return
>>> from the function call with the relevant failure return value.
>>>
>>> Additionally add the 2 checks for i_nlink == 0 and i_nlink == 1 in
>>> sanity_check_inode in order to detect on-disk corruption early.
>>>
>>> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
>>> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
>>> Tested-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
>>> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
>>> ---
>>>  fs/f2fs/inode.c | 10 ++++++++++
>>>  fs/f2fs/namei.c | 15 +++++++++++----
>>>  2 files changed, 21 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>>> index 8c4eafe9ffac..089cbf3646f0 100644
>>> --- a/fs/f2fs/inode.c
>>> +++ b/fs/f2fs/inode.c
>>> @@ -294,6 +294,16 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
>>>  		return false;
>>>  	}
>>>  
>>> +	if (unlikely(inode->i_nlink == 0)) {
>>
>> This is a possible case, as an orphan inode may exist in filesystem after sudden
>> power-cut.
>>
>> Thanks,
>>
> 
> Hi Chao,
> 
> Do you suggest that it should not be wrapped in unlikely()?

Nikola,

No, I think we should not add this sanity check "inode->i_nlink == 0"
into sanity_check_inode(), as for an orphan inode, its i_nlink is zero.
We expect to get the inode w/o failure in recover_orphan_inode().

> 
> I also now realise that I intended to wrap the "else if" case
> as well but I've missed it in the final patch.

Looks fine to add unlike for the "dir->i_nlink == 1" case.

Thanks,

> 
> Should I resend the patch with both cases wrapped in "unlikely()"
> or would you suggest otherwise?
> 
> 
>>> +		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
>>> +			  __func__, inode->i_ino);
>>> +		return false;
>>> +	} else if (S_ISDIR(inode->i_mode) && inode->i_nlink == 1) {
>>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
>>> +			  __func__, inode->i_ino);
>>> +		return false;
>>> +	}
>>> +
>>>  	if (f2fs_has_extra_attr(inode)) {
>>>  		if (!f2fs_sb_has_extra_attr(sbi)) {
>>>  			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
>>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
>>> index 40cf80fd9d9a..d13077bad482 100644
>>> --- a/fs/f2fs/namei.c
>>> +++ b/fs/f2fs/namei.c
>>> @@ -572,10 +572,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>>>  	if (unlikely(inode->i_nlink == 0)) {
>>>  		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
>>>  			  __func__, inode->i_ino);
>>> -		err = -EFSCORRUPTED;
>>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
>>> -		f2fs_folio_put(folio, false);
>>> -		goto out;
>>> +		goto corrupted;
>>> +	} else if (S_ISDIR(inode->i_mode) && inode->i_nlink == 1) {
>>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
>>> +			  __func__, inode->i_ino);
>>> +		goto corrupted;
>>>  	}
>>>  
>>>  	f2fs_balance_fs(sbi, true);
>>> @@ -601,6 +602,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>>>  
>>>  	if (IS_DIRSYNC(dir))
>>>  		f2fs_sync_fs(sbi->sb, 1);
>>> +
>>> +	goto out;
>>> +corrupted:
>>> +	err = -EFSCORRUPTED;
>>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
>>> +	f2fs_folio_put(folio, false);
>>>  out:
>>>  	trace_f2fs_unlink_exit(inode, err);
>>>  	return err;
>>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
