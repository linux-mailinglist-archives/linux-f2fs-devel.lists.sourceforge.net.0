Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19304CFBB1D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 03:19:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4/fmWYW2+nPvIQxGugTcUo87uUcq2WCLXwg4QDglVOM=; b=Rox18mLdnkTYTlBl5qpVNoO0rs
	xhf7cGnsz9XCcw6DMJsi61WfT+VZSBvknXi6YnYBWQA7VKvF0b7VgZOM6P+3Qc0QyiwRXPl3B1zGz
	9PHoZQR4z6ccKo3mp+rBi6phgm6iMQORWw+FlFmzhtNO1knlpj6Gp9XnJU+vROQU13JI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdJ8m-0000oG-Nu;
	Wed, 07 Jan 2026 02:19:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3lsJdaQkbAOMXdePFQQJWFUUNI.LTTLQJZXJWHTSYJSY.HTR@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vdJ8l-0000oA-6J for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 02:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:To:From:
 Subject:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BAbsJU1DWgK3LHp5XAQeHdFwhsW4fYHu+oiMAyzAIvo=; b=YeRztMCpROy4dqzTULm+c6Nn+G
 nwdNzklQT6VJZDfAwWAndkGW3HTVI36vWkmB6Jwt2wMk4Qvn3biC6uWuNfY5PxrmsiLdoG4EYtqy8
 9VchIX5iKI611BpfAWeYSRtFq2aEzUK2Uzpd0G2rJ69XNRI2Jimo+b3PzXYS/m+dcVrI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:To:From:Subject:Message-ID:
 In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BAbsJU1DWgK3LHp5XAQeHdFwhsW4fYHu+oiMAyzAIvo=; b=ZfZf2NSBgfPRjvIPipJLFUf3iA
 ijxnlhKIarCJTS2WZ7TkU8vLbc+cNu+hFAJ2WLa5EVgBGc6HtcGV8STlC1xrdsbWsLS4R83GK4Qzo
 LkLMXKbPRxhuwsUUFQ85ptCnomrDZXDZbUwHrviBKnW4LN6z9KQZHp/dtuNh7J9e6Oow=;
Received: from mail-oo1-f70.google.com ([209.85.161.70])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vdJ8j-000250-44 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 02:19:15 +0000
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-65f540eb569so1853124eaf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 Jan 2026 18:19:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767752342; x=1768357142;
 h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
 :date:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BAbsJU1DWgK3LHp5XAQeHdFwhsW4fYHu+oiMAyzAIvo=;
 b=PXtWkmHI3ThWiEn+tvImXbTEe8y56cw3QEpaVIf0CL/B1ZsIJADU297atjpYWWvaEI
 Bj3pET2XtDZ6NtP9zFyLLahYxvbxfKtaQV1VUpO2Q4qnfQaxHCV2rR1hy33qYy2aL9li
 mSVcKRJPJhe9WzAYEFa5VELlIMo0rlRCq/nsBmxqFzOsBH6auwnt+eOWhrmSDAwNVGgd
 4zLXEYx69n+blcreYjvcoy/X0ZLcWIEWSOPl/NSxnF89AjW0yAqjfow+aIDINK8roCU9
 PuMwXzukGJUGg+22zYjlSBARTkll7Bpw0u/NHqswJ+dSW2H3mAwagrv6eVWnwzKBgs4g
 fdwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIgqtFkQozNLIiMtEsWsYAHLNk1FsurI6urr1li1ga2UxRudP+c8U/IXaciDiIM+NVpGX2dyopRusGf0tvMD8y@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzTWjfdQyyMaN2wk1dEN8YyD+HOB0IW90l5wPEt1J1uFxQ7M7rl
 3rmFvwy5J7iSRiwFYqN+Qr9ZTSJC8iNofU9i62FtXH9l3ssXvbejSUX5s+AP1qDEUMTlExUy48U
 oJASxe70jSXU+WPrw011J32gM7oLc2I9fs32rT/0u+EcZYpPu0ngp64Bezi0=
X-Google-Smtp-Source: AGHT+IFmxG6tnHt0OuX0x5hJDh50etwFWEyUmEGDILcapkyiUo07T+MNRRvQO2oA9OfM1jvA7VlNF2y/GL9ZsU9ZFTxwE9oUgZZa
MIME-Version: 1.0
X-Received: by 2002:a05:6820:770b:b0:659:9a49:8ff9 with SMTP id
 006d021491bc7-65f54f68da2mr294441eaf.38.1767752342420; Tue, 06 Jan 2026
 18:19:02 -0800 (PST)
Date: Tue, 06 Jan 2026 18:19:02 -0800
In-Reply-To: <4cbb379c-99e7-4f87-a435-43b3cecdf888@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <695dc296.050a0220.1c677c.0352.GAE@google.com>
From: syzbot <syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot tried to test the proposed patch but the build/boot
 failed: c 0x1003 length: 249 > 9 [ 99.252780][ T4680] Bluetooth: hci0:
 unexpected
 cc 0x1001 length: 249 > 9 [ 99.258304][ T4680] Bluetooth: hci0: unexpected
 cc 0x0c23 length: 249 > 4 [ 99.262003][ T4680] Blue [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.70 listed in wl.mailspike.net]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vdJ8j-000250-44
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] KASAN: use-after-free Read in
 f2fs_write_end_io (2)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

c 0x1003 length: 249 > 9
[   99.252780][ T4680] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > 9
[   99.258304][ T4680] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > 4
[   99.262003][ T4680] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > 2
[   99.904250][  T947] wlan0: Created IBSS using preconfigured BSSID 50:50:50:50:50:50
[   99.908039][  T947] wlan0: Creating new IBSS network, BSSID 50:50:50:50:50:50
[   99.960090][ T1131] wlan1: Created IBSS using preconfigured BSSID 50:50:50:50:50:50
[   99.963625][ T1131] wlan1: Creating new IBSS network, BSSID 50:50:50:50:50:50
[  101.111055][ T5380] chnl_net:caif_netlink_parms(): no params data found
[  101.277872][ T5380] bridge0: port 1(bridge_slave_0) entered blocking state
[  101.286086][ T5380] bridge0: port 1(bridge_slave_0) entered disabled state
[  101.289331][ T5380] bridge_slave_0: entered allmulticast mode
[  101.304573][ T5380] bridge_slave_0: entered promiscuous mode
[  101.311175][ T5380] bridge0: port 2(bridge_slave_1) entered blocking state
[  101.314400][ T5380] bridge0: port 2(bridge_slave_1) entered disabled state
[  101.318351][ T5380] bridge_slave_1: entered allmulticast mode
[  101.322134][ T5380] bridge_slave_1: entered promiscuous mode
[  101.348427][ T5380] bond0: (slave bond_slave_0): Enslaving as an active interface with an up link
[  101.357433][ T5380] bond0: (slave bond_slave_1): Enslaving as an active interface with an up link
[  101.383478][ T5380] team0: Port device team_slave_0 added
[  101.388135][ T5380] team0: Port device team_slave_1 added
[  101.411977][ T5380] batman_adv: batadv0: Adding interface: batadv_slave_0
[  101.415073][ T5380] batman_adv: batadv0: The MTU of interface batadv_slave_0 is too small (1500) to handle the transport of batman-adv packets. Packets going over this interface will be fragmented on layer2 which could impact the performance. Setting the MTU to 1532 would solve the problem.
[  101.427067][ T5380] batman_adv: batadv0: Not using interface batadv_slave_0 (retrying later): interface not active
[  101.433759][ T5380] batman_adv: batadv0: Adding interface: batadv_slave_1
[  101.437187][ T5380] batman_adv: batadv0: The MTU of interface batadv_slave_1 is too small (1500) to handle the transport of batman-adv packets. Packets going over this interface will be fragmented on layer2 which could impact the performance. Setting the MTU to 1532 would solve the problem.
[  101.448054][ T5380] batman_adv: batadv0: Not using interface batadv_slave_1 (retrying later): interface not active
[  101.483243][ T5380] hsr_slave_0: entered promiscuous mode
[  101.486999][ T5380] hsr_slave_1: entered promiscuous mode
[  101.640469][ T5380] netdevsim netdevsim0 netdevsim0: renamed from eth0
[  101.650511][ T5380] netdevsim netdevsim0 netdevsim1: renamed from eth1
[  101.657246][ T5380] netdevsim netdevsim0 netdevsim2: renamed from eth2
[  101.663682][ T5380] netdevsim netdevsim0 netdevsim3: renamed from eth3
[  101.742774][ T5380] 8021q: adding VLAN 0 to HW filter on device bond0
[  101.761501][ T5380] 8021q: adding VLAN 0 to HW filter on device team0
[  101.770624][  T947] bridge0: port 1(bridge_slave_0) entered blocking state
[  101.773903][  T947] bridge0: port 1(bridge_slave_0) entered forwarding state
[  101.786737][ T1131] bridge0: port 2(bridge_slave_1) entered blocking state
[  101.789882][ T1131] bridge0: port 2(bridge_slave_1) entered forwarding state
[  102.002757][ T5380] 8021q: adding VLAN 0 to HW filter on device batadv0
[  102.041139][ T5380] veth0_vlan: entered promiscuous mode
[  102.050273][ T5380] veth1_vlan: entered promiscuous mode
[  102.080200][ T5380] veth0_macvtap: entered promiscuous mode
[  102.087176][ T5380] veth1_macvtap: entered promiscuous mode
[  102.108084][ T5380] batman_adv: batadv0: Interface activated: batadv_slave_0
[  102.119233][ T5380] batman_adv: batadv0: Interface activated: batadv_slave_1
[  102.129583][  T947] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 family 0 port 6081 - 0
[  102.141577][  T947] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 family 0 port 6081 - 0
[  102.145405][  T947] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 family 0 port 6081 - 0
[  102.160213][ T4047] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 family 0 port 6081 - 0
[  102.423332][ T3019] netdevsim netdevsim0 netdevsim3 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
[  102.589933][ T3019] netdevsim netdevsim0 netdevsim2 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
[  102.698091][ T3019] netdevsim netdevsim0 netdevsim1 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
[  102.788477][ T3019] netdevsim netdevsim0 netdevsim0 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
[  105.309210][ T3019] bridge_slave_1: left allmulticast mode
[  105.311909][ T3019] bridge_slave_1: left promiscuous mode
[  105.331282][ T3019] bridge0: port 2(bridge_slave_1) entered disabled state
[  105.387138][ T3019] bridge_slave_0: left allmulticast mode
[  105.389688][ T3019] bridge_slave_0: left promiscuous mode
[  105.392386][ T3019] bridge0: port 1(bridge_slave_0) entered disabled state
[  106.096537][ T3019] bond0 (unregistering): (slave bond_slave_0): Releasing backup interface
[  106.103033][ T3019] bond0 (unregistering): (slave bond_slave_1): Releasing backup interface
[  106.117388][ T3019] bond0 (unregistering): Released all slaves
[  106.229126][ T3019] hsr_slave_0: left promiscuous mode
[  106.246123][ T3019] hsr_slave_1: left promiscuous mode
[  106.258491][ T3019] batman_adv: batadv0: Interface deactivated: batadv_slave_0
[  106.261745][ T3019] batman_adv: batadv0: Removing interface: batadv_slave_0
[  106.286794][ T3019] batman_adv: batadv0: Interface deactivated: batadv_slave_1
[  106.290111][ T3019] batman_adv: batadv0: Removing interface: batadv_slave_1
[  106.325813][ T3019] veth1_macvtap: left promiscuous mode
[  106.329044][ T3019] veth0_macvtap: left promiscuous mode
[  106.331694][ T3019] veth1_vlan: left promiscuous mode
[  106.334122][ T3019] veth0_vlan: left promiscuous mode
[  106.797480][ T3019] team0 (unregistering): Port device team_slave_1 removed
[  106.821140][ T3019] team0 (unregistering): Port device team_slave_0 removed
2026/01/07 02:18:07 executed programs: 0
[  108.259947][   T46] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > 1
[  108.264618][   T46] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > 9
[  108.270695][   T46] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > 9
[  108.274422][   T46] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > 4
[  108.278195][   T46] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > 2
[  108.730010][ T5451] chnl_net:caif_netlink_parms(): no params data found
[  108.907477][ T5451] bridge0: port 1(bridge_slave_0) entered blocking state
[  108.910655][ T5451] bridge0: port 1(bridge_slave_0) entered disabled state
[  108.913831][ T5451] bridge_slave_0: entered allmulticast mode
[  108.929157][ T5451] bridge_slave_0: entered promiscuous mode
[  108.939210][ T5451] bridge0: port 2(bridge_slave_1) entered blocking state
[  108.942482][ T5451] bridge0: port 2(bridge_slave_1) entered disabled state
[  108.950846][ T5451] bridge_slave_1: entered allmulticast mode
[  108.965783][ T5451] bridge_slave_1: entered promiscuous mode
[  109.018144][ T5451] bond0: (slave bond_slave_0): Enslaving as an active interface with an up link
[  109.026049][ T5451] bond0: (slave bond_slave_1): Enslaving as an active interface with an up link
[  109.073929][ T5451] team0: Port device team_slave_0 added
[  109.085217][ T5451] team0: Port device team_slave_1 added
[  109.128253][ T5451] batman_adv: batadv0: Adding interface: batadv_slave_0
[  109.131303][ T5451] batman_adv: batadv0: The MTU of interface batadv_slave_0 is too small (1500) to handle the transport of batman-adv packets. Packets going over this interface will be fragmented on layer2 which could impact the performance. Setting the MTU to 1532 would solve the problem.
[  109.156217][ T5451] batman_adv: batadv0: Not using interface batadv_slave_0 (retrying later): interface not active
[  109.177176][ T5451] batman_adv: batadv0: Adding interface: batadv_slave_1
[  109.180214][ T5451] batman_adv: batadv0: The MTU of interface batadv_slave_1 is too small (1500) to handle the transport of batman-adv packets. Packets going over this interface will be fragmented on layer2 which could impact the performance. Setting the MTU to 1532 would solve the problem.
[  109.208335][ T5451] batman_adv: batadv0: Not using interface batadv_slave_1 (retrying later): interface not active
[  109.278165][ T5451] hsr_slave_0: entered promiscuous mode
[  109.286205][ T5451] hsr_slave_1: entered promiscuous mode
[  109.779620][ T5451] netdevsim netdevsim0 netdevsim0: renamed from eth0
[  109.800234][ T5451] netdevsim netdevsim0 netdevsim1: renamed from eth1
[  109.807679][ T5451] netdevsim netdevsim0 netdevsim2: renamed from eth2
[  109.829275][ T5451] netdevsim netdevsim0 netdevsim3: renamed from eth3
[  109.967755][ T5451] 8021q: adding VLAN 0 to HW filter on device bond0
[  109.993637][ T5451] 8021q: adding VLAN 0 to HW filter on device team0
[  110.013449][  T947] bridge0: port 1(bridge_slave_0) entered blocking state
[  110.016837][  T947] bridge0: port 1(bridge_slave_0) entered forwarding state
[  110.041939][  T947] bridge0: port 2(bridge_slave_1) entered blocking state
[  110.045001][  T947] bridge0: port 2(bridge_slave_1) entered forwarding state
[  110.113140][ T5451] hsr0: Slave A (hsr_slave_0) is not up; please bring it up to get a fully working HSR network
[  110.126403][ T5451] hsr0: Slave B (hsr_slave_1) is not up; please bring it up to get a fully working HSR network
[  110.306727][   T46] Bluetooth: hci0: command tx timeout
[  110.407891][ T5451] 8021q: adding VLAN 0 to HW filter on device batadv0
[  110.474914][ T5451] veth0_vlan: entered promiscuous mode
[  110.501129][ T5451] veth1_vlan: entered promiscuous mode
[  110.548766][ T5451] veth0_macvtap: entered promiscuous mode
[  110.566415][ T5451] veth1_macvtap: entered promiscuous mode
[  110.594368][ T5451] batman_adv: batadv0: Interface activated: batadv_slave_0
[  110.627391][ T5451] batman_adv: batadv0: Interface activated: batadv_slave_1
[  110.639617][  T947] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 family 0 port 6081 - 0
[  110.643516][  T947] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 family 0 port 6081 - 0
[  110.667089][  T947] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 family 0 port 6081 - 0
[  110.702519][  T947] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 family 0 port 6081 - 0
[  110.791338][  T947] wlan0: Created IBSS using preconfigured BSSID 50:50:50:50:50:50
[  110.795044][  T947] wlan0: Creating new IBSS network, BSSID 50:50:50:50:50:50
[  110.848266][  T947] wlan1: Created IBSS using preconfigured BSSID 50:50:50:50:50:50
[  110.851713][  T947] wlan1: Creating new IBSS network, BSSID 50:50:50:50:50:50
SYZFAIL: failed to recv rpc
fd=3 want=4 recv=0 n=0 (errno 9: Bad file descriptor)
[  112.188996][ T1131] netdevsim netdevsim0 netdevsim3 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
[  113.352275][ T1131] netdevsim netdevsim0 netdevsim2 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
[  113.627013][ T1131] netdevsim netdevsim0 netdevsim1 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
[  113.684954][ T1131] netdevsim netdevsim0 netdevsim0 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
[  113.807220][ T1131] bridge_slave_1: left allmulticast mode
[  113.809850][ T1131] bridge_slave_1: left promiscuous mode
[  113.812539][ T1131] bridge0: port 2(bridge_slave_1) entered disabled state
[  113.832063][ T1131] bridge_slave_0: left allmulticast mode
[  113.834590][ T1131] bridge_slave_0: left promiscuous mode
[  113.837572][ T1131] bridge0: port 1(bridge_slave_0) entered disabled state
[  114.221189][ T1131] bond0 (unregistering): (slave bond_slave_0): Releasing backup interface
[  114.227289][ T1131] bond0 (unregistering): (slave bond_slave_1): Releasing backup interface
[  114.232468][ T1131] bond0 (unregistering): Released all slaves
[  114.487951][ T1131] hsr_slave_0: left promiscuous mode
[  114.490767][ T1131] hsr_slave_1: left promiscuous mode
[  114.498999][ T1131] batman_adv: batadv0: Interface deactivated: batadv_slave_0
[  114.502267][ T1131] batman_adv: batadv0: Removing interface: batadv_slave_0
[  114.517714][ T1131] batman_adv: batadv0: Interface deactivated: batadv_slave_1
[  114.521062][ T1131] batman_adv: batadv0: Removing interface: batadv_slave_1
[  114.549206][ T1131] veth1_macvtap: left promiscuous mode
[  114.551802][ T1131] veth0_macvtap: left promiscuous mode
[  114.554336][ T1131] veth1_vlan: left promiscuous mode
[  114.567501][ T1131] veth0_vlan: left promiscuous mode
[  114.940636][ T1131] team0 (unregistering): Port device team_slave_1 removed
[  114.967019][ T1131] team0 (unregistering): Port device team_slave_0 removed


syzkaller build log:
go env (err=<nil>)
AR='ar'
CC='gcc'
CGO_CFLAGS='-O2 -g'
CGO_CPPFLAGS=''
CGO_CXXFLAGS='-O2 -g'
CGO_ENABLED='1'
CGO_FFLAGS='-O2 -g'
CGO_LDFLAGS='-O2 -g'
CXX='g++'
GCCGO='gccgo'
GO111MODULE='auto'
GOAMD64='v1'
GOARCH='amd64'
GOAUTH='netrc'
GOBIN=''
GOCACHE='/syzkaller/.cache/go-build'
GOCACHEPROG=''
GODEBUG=''
GOENV='/syzkaller/.config/go/env'
GOEXE=''
GOEXPERIMENT=''
GOFIPS140='off'
GOFLAGS=''
GOGCCFLAGS='-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=0 -ffile-prefix-map=/tmp/go-build1445029477=/tmp/go-build -gno-record-gcc-switches'
GOHOSTARCH='amd64'
GOHOSTOS='linux'
GOINSECURE=''
GOMOD='/syzkaller/jobs/linux/gopath/src/github.com/google/syzkaller/go.mod'
GOMODCACHE='/syzkaller/jobs/linux/gopath/pkg/mod'
GONOPROXY=''
GONOSUMDB=''
GOOS='linux'
GOPATH='/syzkaller/jobs/linux/gopath'
GOPRIVATE=''
GOPROXY='https://proxy.golang.org,direct'
GOROOT='/usr/local/go'
GOSUMDB='sum.golang.org'
GOTELEMETRY='local'
GOTELEMETRYDIR='/syzkaller/.config/go/telemetry'
GOTMPDIR=''
GOTOOLCHAIN='auto'
GOTOOLDIR='/usr/local/go/pkg/tool/linux_amd64'
GOVCS=''
GOVERSION='go1.24.4'
GOWORK=''
PKG_CONFIG='pkg-config'

git status (err=<nil>)
HEAD detached at d1b870e1003b
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contributing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags="-s -w -X github.com/google/syzkaller/prog.GitRevision=d1b870e1003b52891d2196c1e2ee42fe905010ba -X github.com/google/syzkaller/prog.gitRevisionDate=20251128-125159"  ./sys/syz-sysgen | grep -q false || go install -ldflags="-s -w -X github.com/google/syzkaller/prog.GitRevision=d1b870e1003b52891d2196c1e2ee42fe905010ba -X github.com/google/syzkaller/prog.gitRevisionDate=20251128-125159"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contributing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=linux GOARCH=amd64 go build -ldflags="-s -w -X github.com/google/syzkaller/prog.GitRevision=d1b870e1003b52891d2196c1e2ee42fe905010ba -X github.com/google/syzkaller/prog.gitRevisionDate=20251128-125159"  -o ./bin/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wframe-larger-than=16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-format-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -static-pie -std=c++17 -I. -Iexecutor/_include   -DGOOS_linux=1 -DGOARCH_amd64=1 \
	-DHOSTGOOS_linux=1 -DGIT_REVISION=\"d1b870e1003b52891d2196c1e2ee42fe905010ba\"
/usr/bin/ld: /tmp/cc4kC0pD.o: in function `Connection::Connect(char const*, char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEPKcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
./tools/check-syzos.sh 2>/dev/null


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=12df7e9a580000


Tested on:

commit:         af98ee9d f2fs: fix use-after-free in f2fs_write_end_io
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
kernel config:  https://syzkaller.appspot.com/x/.config?x=513255d80ab78f2b
dashboard link: https://syzkaller.appspot.com/bug?extid=b4444e3c972a7a124187
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Note: no patches were applied.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
