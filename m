Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F413BCFD185
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 11:05:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=zvExhRfp3YM4mP+i4bM5RkCwxRAD9BnIiq/v2d39Ioo=; b=i1X/YDD9VZaqMjdAsn1zGVx0XY
	YZsW7SX9/GEmuU/28v7TJwu0jANeLtPCUQtZHRsIzxPOEIpacBQ/sMfq9FBKvpeOr2Xku6HyDqLai
	D3mjUKa1sG4oYoCu24zVeljgqc+v1DPH+abTpuV8kex79f7iq1sfEfQf1GVV9/1xE5B8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdQPg-0001s8-FI;
	Wed, 07 Jan 2026 10:05:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3zS9eaQkbAPYqwxiYjjcpYnngb.emmejcsqcpamlrclr.amk@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vdQPc-0001pT-Hc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 10:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:To:From:
 Subject:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=67VnNgu1CF0NBdr3K0HBsF63kJxrUVYSeGtpmvkdKGM=; b=aK5+Vxp+495ivWfJHX96uoZRy4
 tqURlOnYbnVI7xXsUuLcE1KMNUT4M1sXDukYw6VxTjwx/l62l3I9B2ZJyY/KkB1p8WobIkLbjODp4
 dwMBelJrSnfKhvoV6xxckoTrnDDGMvY81hPo33aS3C/aLGtLIrJT2d5On9s+FahUdXg4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:To:From:Subject:Message-ID:
 In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=67VnNgu1CF0NBdr3K0HBsF63kJxrUVYSeGtpmvkdKGM=; b=Tv43jzVXrV+viREcYlDZv6GcI+
 fmUc8SIRQe9MrE73Cx5iOGESooB+N0nih6yS0cJMqV0FlS+zaqj2jScY126d/E6OeU5b0ngTTDYDJ
 mcxHvVverAFSAoCTmpiN5mKeXq7YCBxulsTFo3p9FSfFtnjsgqdXZtENTuGzo9dx9vyw=;
Received: from mail-oo1-f70.google.com ([209.85.161.70])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vdQPb-0007EJ-7C for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 10:05:08 +0000
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-656b7cf5c66so3826873eaf.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 Jan 2026 02:05:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767780301; x=1768385101;
 h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
 :date:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=67VnNgu1CF0NBdr3K0HBsF63kJxrUVYSeGtpmvkdKGM=;
 b=Y1TndQAaLByz2roDEuIzk+7IFGR3X1hEbBrUFZAPCOR84Zict9ymtIc9nkC1tF9wqp
 rc8v3sgv00qO1yQHv6f8no6QEjcO73sVE1zgOR49QouLYWs0B7kkiyyVEIoMO5KlkwfE
 ChfGNftna6EtebFT0ax35KcKjnPasQkN+vPKyazbQkzFHneTnGOi7lqStAiD5q6J2LEj
 92DVS8TiTl9yw2qBKkZUzaksTmymdxMRiRAwnTGd/wTlRmGANacixJ6jEetv0mp5jt5T
 0v9r9ugIp3VVPwOAGZ4Sf6u6MbkO6n6HQuvOhpk2Eci2VWDVjMrnZ1iD1gB4hydXDSr7
 91lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3d07Vk2lTodXsIZdWXx1XPn/yIGFdsYi7HOJghpLCSNz0ppKRieP6jC3M2Ll/q9n/5v2vIJ6eh+kH2hzGv/9J@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzGP/iHh/SvdOom5sybM1kSqHgbU9MTuSfzzAXnNVsGF+dqbf66
 o5PpaOvEwimK1gAq/U/PTAUZvuXY8dWeSUheF7ADtc1FBxR+FsXaXXdHrKbxeIr2QnGPYvMppUh
 Lb/6yO3aSCIO0G4sezuzPQeq4pFpGLlHs3KR2v/d824wL6OWCdK8pn2vQ5Zo=
X-Google-Smtp-Source: AGHT+IEbvpl7BcautGB7qW/o/6oR+fWAmIxCDLlecgnCGYP5Ro4CRDyuXkn6o7m481qbE9vyVmSdSXByXETd81aPBzd8qE9S2Sir
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1795:b0:659:9a49:8f43 with SMTP id
 006d021491bc7-65f550cfd68mr668018eaf.84.1767780301618; Wed, 07 Jan 2026
 02:05:01 -0800 (PST)
Date: Wed, 07 Jan 2026 02:05:01 -0800
In-Reply-To: <bec27999-93fa-49bf-86c2-1c6c007ccf35@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <695e2fcd.050a0220.1c677c.035e.GAE@google.com>
From: syzbot <syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com>
To: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot tried to test the proposed patch but the build/boot
 failed: 50:50:50 [ 96.324372][ T4608] wlan0: Creating new IBSS network, BSSID
 50:50:50:50:50:50 [ 96.383532][ T13] wlan1: Created IBSS using preconfigured
 BSSID 50:50:50:50:50:50 [ 96.388909][ T13] wlan1: Cre [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.161.70 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.70 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vdQPb-0007EJ-7C
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

50:50:50
[   96.324372][ T4608] wlan0: Creating new IBSS network, BSSID 50:50:50:50:50:50
[   96.383532][   T13] wlan1: Created IBSS using preconfigured BSSID 50:50:50:50:50:50
[   96.388909][   T13] wlan1: Creating new IBSS network, BSSID 50:50:50:50:50:50
[   98.981820][ T4685] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > 1
[   98.986155][ T4685] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > 9
[   98.989980][ T4685] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > 9
[   98.993960][ T4685] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > 4
[   98.997492][ T4685] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > 2
[  101.080148][ T5400] chnl_net:caif_netlink_parms(): no params data found
[  101.260660][ T5400] bridge0: port 1(bridge_slave_0) entered blocking state
[  101.271979][ T5400] bridge0: port 1(bridge_slave_0) entered disabled state
[  101.275128][ T5400] bridge_slave_0: entered allmulticast mode
[  101.291786][ T5400] bridge_slave_0: entered promiscuous mode
[  101.298693][ T5400] bridge0: port 2(bridge_slave_1) entered blocking state
[  101.309121][ T5400] bridge0: port 2(bridge_slave_1) entered disabled state
[  101.312608][ T5400] bridge_slave_1: entered allmulticast mode
[  101.321527][ T5400] bridge_slave_1: entered promiscuous mode
[  101.374348][ T5400] bond0: (slave bond_slave_0): Enslaving as an active interface with an up link
[  101.394422][ T5400] bond0: (slave bond_slave_1): Enslaving as an active interface with an up link
[  101.443124][ T5400] team0: Port device team_slave_0 added
[  101.452091][ T5400] team0: Port device team_slave_1 added
[  101.495794][ T5400] batman_adv: batadv0: Adding interface: batadv_slave_0
[  101.498939][ T5400] batman_adv: batadv0: The MTU of interface batadv_slave_0 is too small (1500) to handle the transport of batman-adv packets. Packets going over this interface will be fragmented on layer2 which could impact the performance. Setting the MTU to 1532 would solve the problem.
[  101.541327][ T5400] batman_adv: batadv0: Not using interface batadv_slave_0 (retrying later): interface not active
[  101.571912][ T5400] batman_adv: batadv0: Adding interface: batadv_slave_1
[  101.574976][ T5400] batman_adv: batadv0: The MTU of interface batadv_slave_1 is too small (1500) to handle the transport of batman-adv packets. Packets going over this interface will be fragmented on layer2 which could impact the performance. Setting the MTU to 1532 would solve the problem.
[  101.611346][ T5400] batman_adv: batadv0: Not using interface batadv_slave_1 (retrying later): interface not active
[  101.716466][ T5400] hsr_slave_0: entered promiscuous mode
[  101.720143][ T5400] hsr_slave_1: entered promiscuous mode
[  102.035333][ T5400] netdevsim netdevsim0 netdevsim0: renamed from eth0
[  102.057801][ T5400] netdevsim netdevsim0 netdevsim1: renamed from eth1
[  102.066664][ T5400] netdevsim netdevsim0 netdevsim2: renamed from eth2
[  102.085706][ T5400] netdevsim netdevsim0 netdevsim3: renamed from eth3
[  102.225047][ T5400] 8021q: adding VLAN 0 to HW filter on device bond0
[  102.254868][ T5400] 8021q: adding VLAN 0 to HW filter on device team0
[  102.295073][ T1127] bridge0: port 1(bridge_slave_0) entered blocking state
[  102.298513][ T1127] bridge0: port 1(bridge_slave_0) entered forwarding state
[  102.313626][ T1127] bridge0: port 2(bridge_slave_1) entered blocking state
[  102.316779][ T1127] bridge0: port 2(bridge_slave_1) entered forwarding state
[  102.538955][ T5400] 8021q: adding VLAN 0 to HW filter on device batadv0
[  102.576951][ T5400] veth0_vlan: entered promiscuous mode
[  102.584258][ T5400] veth1_vlan: entered promiscuous mode
[  102.606836][ T5400] veth0_macvtap: entered promiscuous mode
[  102.617483][ T5400] veth1_macvtap: entered promiscuous mode
[  102.631115][ T5400] batman_adv: batadv0: Interface activated: batadv_slave_0
[  102.644037][ T5400] batman_adv: batadv0: Interface activated: batadv_slave_1
[  102.656266][ T4637] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 family 0 port 6081 - 0
[  102.667017][ T4637] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 family 0 port 6081 - 0
[  102.678832][ T4637] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 family 0 port 6081 - 0
[  102.699431][ T4637] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 family 0 port 6081 - 0
[  102.827338][ T4637] netdevsim netdevsim0 netdevsim3 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
[  102.874563][ T4637] netdevsim netdevsim0 netdevsim2 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
[  102.916861][ T4637] netdevsim netdevsim0 netdevsim1 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
[  102.955081][ T4637] netdevsim netdevsim0 netdevsim0 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
2026/01/07 10:04:23 executed programs: 0
[  103.704543][   T47] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > 1
[  103.708655][   T47] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > 9
[  103.713035][   T47] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > 9
[  103.716711][   T47] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > 4
[  103.720706][   T47] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > 2
[  103.874928][ T5441] chnl_net:caif_netlink_parms(): no params data found
[  104.002432][ T5441] bridge0: port 1(bridge_slave_0) entered blocking state
[  104.005631][ T5441] bridge0: port 1(bridge_slave_0) entered disabled state
[  104.009058][ T5441] bridge_slave_0: entered allmulticast mode
[  104.025056][ T5441] bridge_slave_0: entered promiscuous mode
[  104.033625][ T5441] bridge0: port 2(bridge_slave_1) entered blocking state
[  104.037020][ T5441] bridge0: port 2(bridge_slave_1) entered disabled state
[  104.040130][ T5441] bridge_slave_1: entered allmulticast mode
[  104.053666][ T5441] bridge_slave_1: entered promiscuous mode
[  104.115026][ T5441] bond0: (slave bond_slave_0): Enslaving as an active interface with an up link
[  104.136512][ T5441] bond0: (slave bond_slave_1): Enslaving as an active interface with an up link
[  104.178539][ T5441] team0: Port device team_slave_0 added
[  104.183425][ T5441] team0: Port device team_slave_1 added
[  104.207708][ T5441] batman_adv: batadv0: Adding interface: batadv_slave_0
[  104.210805][ T5441] batman_adv: batadv0: The MTU of interface batadv_slave_0 is too small (1500) to handle the transport of batman-adv packets. Packets going over this interface will be fragmented on layer2 which could impact the performance. Setting the MTU to 1532 would solve the problem.
[  104.223299][ T5441] batman_adv: batadv0: Not using interface batadv_slave_0 (retrying later): interface not active
[  104.230664][ T5441] batman_adv: batadv0: Adding interface: batadv_slave_1
[  104.234253][ T5441] batman_adv: batadv0: The MTU of interface batadv_slave_1 is too small (1500) to handle the transport of batman-adv packets. Packets going over this interface will be fragmented on layer2 which could impact the performance. Setting the MTU to 1532 would solve the problem.
[  104.246544][ T5441] batman_adv: batadv0: Not using interface batadv_slave_1 (retrying later): interface not active
[  104.281972][ T5441] hsr_slave_0: entered promiscuous mode
[  104.285329][ T5441] hsr_slave_1: entered promiscuous mode
[  104.288328][ T5441] debugfs: 'hsr0' already exists in 'hsr'
[  104.290838][ T5441] Cannot create hsr debugfs directory
[  105.062924][ T4637] bridge_slave_1: left allmulticast mode
[  105.065283][ T4637] bridge_slave_1: left promiscuous mode
[  105.072635][ T4637] bridge0: port 2(bridge_slave_1) entered disabled state
[  105.084121][ T4637] bridge_slave_0: left allmulticast mode
[  105.086616][ T4637] bridge_slave_0: left promiscuous mode
[  105.089229][ T4637] bridge0: port 1(bridge_slave_0) entered disabled state
[  105.434250][ T4637] bond0 (unregistering): (slave bond_slave_0): Releasing backup interface
[  105.441979][ T4637] bond0 (unregistering): (slave bond_slave_1): Releasing backup interface
[  105.446733][ T4637] bond0 (unregistering): Released all slaves
[  105.546762][ T4637] hsr_slave_0: left promiscuous mode
[  105.561587][ T4637] hsr_slave_1: left promiscuous mode
[  105.564672][ T4637] batman_adv: batadv0: Interface deactivated: batadv_slave_0
[  105.568054][ T4637] batman_adv: batadv0: Removing interface: batadv_slave_0
[  105.578013][ T4637] batman_adv: batadv0: Interface deactivated: batadv_slave_1
[  105.581111][ T4637] batman_adv: batadv0: Removing interface: batadv_slave_1
[  105.608041][ T4637] veth1_macvtap: left promiscuous mode
[  105.610648][ T4637] veth0_macvtap: left promiscuous mode
[  105.628271][ T4637] veth1_vlan: left promiscuous mode
[  105.632462][ T4637] veth0_vlan: left promiscuous mode
[  105.736315][   T47] Bluetooth: hci0: command tx timeout
[  106.107211][ T4637] team0 (unregistering): Port device team_slave_1 removed
[  106.134290][ T4637] team0 (unregistering): Port device team_slave_0 removed
[  106.578691][ T5441] netdevsim netdevsim0 netdevsim0: renamed from eth0
[  106.599515][ T5441] netdevsim netdevsim0 netdevsim1: renamed from eth1
[  106.616734][ T5441] netdevsim netdevsim0 netdevsim2: renamed from eth2
[  106.630262][ T5441] netdevsim netdevsim0 netdevsim3: renamed from eth3
[  107.173027][ T5441] 8021q: adding VLAN 0 to HW filter on device bond0
[  107.206957][ T5441] 8021q: adding VLAN 0 to HW filter on device team0
[  107.255745][ T3440] bridge0: port 1(bridge_slave_0) entered blocking state
[  107.259102][ T3440] bridge0: port 1(bridge_slave_0) entered forwarding state
[  107.305836][ T3440] bridge0: port 2(bridge_slave_1) entered blocking state
[  107.309126][ T3440] bridge0: port 2(bridge_slave_1) entered forwarding state
[  107.468490][ T5441] 8021q: adding VLAN 0 to HW filter on device batadv0
[  107.504820][ T5441] veth0_vlan: entered promiscuous mode
[  107.513636][ T5441] veth1_vlan: entered promiscuous mode
[  107.533127][ T5441] veth0_macvtap: entered promiscuous mode
[  107.538225][ T5441] veth1_macvtap: entered promiscuous mode
[  107.551007][ T5441] batman_adv: batadv0: Interface activated: batadv_slave_0
[  107.563537][ T5441] batman_adv: batadv0: Interface activated: batadv_slave_1
[  107.573370][   T13] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 family 0 port 6081 - 0
[  107.583446][   T13] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 family 0 port 6081 - 0
[  107.587551][   T13] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 family 0 port 6081 - 0
[  107.620236][   T13] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 family 0 port 6081 - 0
[  107.687153][ T3440] wlan0: Created IBSS using preconfigured BSSID 50:50:50:50:50:50
[  107.690521][ T3440] wlan0: Creating new IBSS network, BSSID 50:50:50:50:50:50
[  107.739992][   T13] wlan1: Created IBSS using preconfigured BSSID 50:50:50:50:50:50
[  107.744091][   T13] wlan1: Creating new IBSS network, BSSID 50:50:50:50:50:50
[  107.821622][   T47] Bluetooth: hci0: command tx timeout
SYZFAIL: failed to recv rpc
fd=3 want=4 recv=0 n=0 (errno 9: Bad file descriptor)
[  109.064804][ T3440] netdevsim netdevsim0 netdevsim3 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
[  110.112799][ T3440] netdevsim netdevsim0 netdevsim2 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
[  110.530922][ T3440] netdevsim netdevsim0 netdevsim1 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
[  110.573006][ T3440] netdevsim netdevsim0 netdevsim0 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
[  110.696901][ T3440] bridge_slave_1: left allmulticast mode
[  110.699371][ T3440] bridge_slave_1: left promiscuous mode
[  110.712675][ T3440] bridge0: port 2(bridge_slave_1) entered disabled state
[  110.717544][ T3440] bridge_slave_0: left allmulticast mode
[  110.720008][ T3440] bridge_slave_0: left promiscuous mode
[  110.724098][ T3440] bridge0: port 1(bridge_slave_0) entered disabled state
[  111.067299][ T3440] bond0 (unregistering): (slave bond_slave_0): Releasing backup interface
[  111.073241][ T3440] bond0 (unregistering): (slave bond_slave_1): Releasing backup interface
[  111.077962][ T3440] bond0 (unregistering): Released all slaves
[  111.288410][ T3440] hsr_slave_0: left promiscuous mode
[  111.290938][ T3440] hsr_slave_1: left promiscuous mode
[  111.302397][ T3440] batman_adv: batadv0: Interface deactivated: batadv_slave_0
[  111.305777][ T3440] batman_adv: batadv0: Removing interface: batadv_slave_0
[  111.326508][ T3440] batman_adv: batadv0: Interface deactivated: batadv_slave_1
[  111.329929][ T3440] batman_adv: batadv0: Removing interface: batadv_slave_1
[  111.348723][ T3440] veth1_macvtap: left promiscuous mode
[  111.362446][ T3440] veth0_macvtap: left promiscuous mode
[  111.365101][ T3440] veth1_vlan: left promiscuous mode
[  111.367513][ T3440] veth0_vlan: left promiscuous mode
[  111.699085][ T3440] team0 (unregistering): Port device team_slave_1 removed
[  111.720608][ T3440] team0 (unregistering): Port device team_slave_0 removed


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
GOGCCFLAGS='-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=0 -ffile-prefix-map=/tmp/go-build1275535676=/tmp/go-build -gno-record-gcc-switches'
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
/usr/bin/ld: /tmp/cc4qdZbn.o: in function `Connection::Connect(char const*, char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEPKcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
./tools/check-syzos.sh 2>/dev/null


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=15dbee9a580000


Tested on:

commit:         1860d530 f2fs: fix to avoid UAF in f2fs_write_end_io()
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
kernel config:  https://syzkaller.appspot.com/x/.config?x=513255d80ab78f2b
dashboard link: https://syzkaller.appspot.com/bug?extid=b4444e3c972a7a124187
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Note: no patches were applied.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
